/**
 * @file
 */

#ifndef TOOLS_QUEUE_HPP_
#define TOOLS_QUEUE_HPP_

#include <stdint.h>
#include <stddef.h>

namespace tools
{

class Queue
{
public:
    Queue(): head_(0), tail_(0), is_empty_(true)
    { }

private:
    size_t head_;
    size_t tail_;
    bool is_empty_;
};

}  // namespace tools



#endif  // TOOLS_QUEUE_HPP_
