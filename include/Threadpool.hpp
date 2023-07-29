#ifndef _THREADPOOL_HPP_
#define _THREADPOOL_HPP_

#include <iostream>
#include <mutex>
#include <atomic>
#include <queue>
#include <thread>
#include <future>
#include <vector>
#include <functional>
#include <condition_variable>
#include "queueMutex.hpp"

#define Debug() {std::cout << "Debug:" << "Error happened! error in line of " << __LINE__ << '\n';}

using taskType = std::function<void()>;

class threadPool
{
    public:
        threadPool(const threadPool&) = delete;
        threadPool& operator = (const threadPool&) = delete;
        threadPool(const threadPool&&) = delete;
        threadPool& operator = (const threadPool&&) = delete; 

        threadPool(int threadNum = 6);
        ~threadPool();

        template<typename Func, typename ...Args>
        auto submitTask(Func&& funcReturn, Args... argSend) -> std::future<decltype(funcReturn(argSend...))>;


    private:
        std::mutex poolLock;                // Lock for all threadpool
        std::atomic<bool> runningStatus;    // atomic for recording threadpool status
        queueMutex<taskType> taskQueue;         // save tasks to submit to threads
        std::vector<std::thread> threadList;// save threads
        std::condition_variable cV;         // Block threads

        void initThreadpool();
};

#endif //THREADPOOL_HPP_