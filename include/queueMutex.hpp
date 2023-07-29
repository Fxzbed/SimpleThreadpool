#ifndef _QUEUEMUTEX_HPP_
#define _QUEUEMUTEX_HPP_

#include <queue>
#include <mutex>

template <typename T>
class queueMutex
{
    public:
        queueMutex(/* args */) { };
        queueMutex(queueMutex &other) { };
        ~queueMutex() { };

        inline bool empty() {
            std::unique_lock<std::mutex> lock(lockQ);
            return queueM.empty();
        }

        inline int size() {
            std::unique_lock<std::mutex> lock(lockQ);
            return queueM.size();
        }

        inline void push(T& t) {
            std::unique_lock<std::mutex> lock(lockQ);
            queueM.push(t);
            return;
        }

        inline bool pop(T& t) {
            std::unique_lock<std::mutex> lock(lockQ);
            queueM.empty() ? {return false;} : {t = std::move(queueM.front()); 
                queueM.pop(); 
                return true;
            };
        }

    private:
        std::mutex lockQ;
        std::queue<T> queueM;
        /* data */
};

#endif //_QUEUEMUTEX_HPP_