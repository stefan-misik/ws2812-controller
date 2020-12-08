#include "tools/generic_queue.hpp"

namespace tools
{

void GenericQueue::empty()
{
    head_ = 0;
    tail_ = 0;
    is_not_empty_ = (0 == capacity_);
}

size_t GenericQueue::insert()
{
    if (isFull())
    {
        return INVALID_ITEM;
    }

    size_t new_item = head_;
    ++head_;

    if (head_ == capacity_)
    {
        head_ = 0;
    }
    is_not_empty_ = true;

    return new_item;
}

size_t GenericQueue::peek() const
{
    if (isEmpty())
    {
        return INVALID_ITEM;
    }

    return tail_;
}

bool GenericQueue::remove()
{
    if (isEmpty())
    {
        return false;
    }

    ++tail_;
    if (tail_ == capacity_)
    {
        tail_ = 0;
    }

    is_not_empty_ = head_ != tail_;

    return true;
}


}  // namespace tools

