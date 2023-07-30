#pragma once

#include <iostream>
#include <mutex>
#include <atomic>
#include <queue>
#include <thread>
#include <future>
#include <vector>
#include <functional>
#include <condition_variable>
//#include "queueMutex.hpp"



struct outPut {
    std::mutex lockPrint;
    void operator()(const char* str) {
        std::unique_lock<std::mutex> locker(lockPrint);
        std::cout << str;
    }
};

template <typename T>
class queueMutex {
    private:
        std::mutex lockQ;
        std::queue<T> queueM;

    public:

        bool empty() {
            std::unique_lock<std::mutex> locker(lockQ);
            return queueM.empty();
        }

        int size() {
            std::unique_lock<std::mutex> locker(lockQ);
            return queueM.size();
        }

        void push(T& t) {
            std::unique_lock<std::mutex> locker(lockQ);
            queueM.emplace(t);
            return;
        }

        void push(T&& t) {
            std::unique_lock<std::mutex> locker(lockQ);
            queueM.emplace(std::move(t));
        }

        bool pop(T& t) {
            std::unique_lock<std::mutex> locker(lockQ);
            if (queueM.empty()) {
                return false;
            }
            else {
                t = std::move(queueM.front());
                queueM.pop();
                return true;
            }
            return true;
        }
};
// self mutex queue class 

#define Debug() {std::cout << "Debug:" << "Error happened! error in line of " << __LINE__ << '\n';}

using taskType = std::function<void()>;

class threadPool
{


private:
    std::mutex poolLock;                    // Lock for all threadpool
    std::atomic<bool> runningStatus;        // atomic for recording threadpool status
    queueMutex<taskType> taskQueue;         // save tasks to submit to threads
    std::vector<std::thread> threadList;    // save threads
    std::condition_variable cV;             // Block threads

    void initThreadpool();

public:
    outPut printMutex;
    threadPool(const threadPool&) = delete;
    threadPool& operator = (const threadPool&) = delete;
    threadPool(const threadPool&&) = delete;
    threadPool& operator = (const threadPool&&) = delete;

    threadPool(int threadNum);
    ~threadPool();

    template<typename Func, typename ...Args>
    auto submitTask(Func&& funcReturn, Args... argSend) -> std::future<decltype(funcReturn(argSend...))>{
        using returnType = typename std::invoke_result<Func, Args...>::type;
        std::function<returnType()> transF1 = std::bind(std::forward<Func>(funcReturn), std::forward<Args>(argSend)...);
        auto transF2 = std::make_shared<std::packaged_task<returnType()>>(transF1);
        
        taskType transF3 = [transF2]() {
            (*transF2)();
        };
        this->taskQueue.push(transF3);
        this->cV.notify_one();

        return transF2->get_future();
    }
};