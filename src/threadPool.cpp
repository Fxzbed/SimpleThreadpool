#include "include/threadPool.hpp"

threadPool::threadPool(int threadNum) : threadList(threadNum), runningStatus(true) {
    initThreadpool();
}

void threadPool::initThreadpool() {
    for (auto &thread : this->threadList) {
        auto workFuncinit = [this] () {
            while (this->runningStatus) {
                taskType taskFunc;
                bool isSussess = false;
                {
                    std::unique_lock<std::mutex> lockerUni(this->poolLock);

                    if (this->taskQueue.empty()) {
                        this->cV.wait(lockerUni);
                    }
                    isSussess = this->taskQueue.pop(taskFunc);
                }
            }
        };

        thread = std::thread(workFuncinit);
    }

}
template<typename Func, typename ...Args>
auto threadPool::submitTask(Func&& funcReturn, Args... argSend) -> std::future<decltype(funcReturn(argSend...))> {
    using returnType = typename std::invoke_result<Func, Args ...>::type;
    std::function<returnType()> taskTrans1 = std::bind(std::forward<func>(funcReturn), std::forward<Args>(argSend) ...);

    auto taskTrans2 = std::make_shared<std::packaged_task<returnType()>> (taskTrans1);

    auto taskTrans3 = [taskTrans2] () {
        (*taskTrans2)();
    };

    this->taskQueue.push(taskTrans3);
    this->cV.notify_one();

    return taskTrans2->get_future();

}

threadPool::~threadPool() {
    this->runningStatus = false;

    this->cV.notify_all();

    for (auto &thread : threadList) {
        if (thread.joinable()) {
            thread.join();
        }
    }
}