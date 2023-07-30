#include <future>
#include <functional>
#include "include/threadPool.hpp"
int TestFunction(int a, int b)
{
    printf("[TestFunction]: done!\n");
    return a;
}

void Test() {
    threadPool testPool(6); 
    // result[0] = 0;
    for (int i = 0; i < 100; i++)
        testPool.submitTask(TestFunction, 1, 2);
}

int main(void)
{

    Test();
    
    //std::this_thread::sleep_for(std::chrono::seconds(1));
    std::cout << "[Main thread]: Main func is done!" << '\n';
    return 0;
}
// #include <mingw.thread.h>
// #include <iostream>
// #include <vector>

// int func (int a)
// {
//     std::cout << a << std::endl;
//     return a;
// }

// int main(void)
// {
//     int x = 1;
//     std::vector<std::thread> array(10);
//     for (auto &thread_ : array)
//     {
//         thread_ = std::thread(func, x ++);
//     }

//     for (auto &thread_ : array)
//     {
//         thread_.join();
//     }
// }