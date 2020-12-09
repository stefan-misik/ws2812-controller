#include "system/event_queue.hpp"

namespace system
{

bool EventQueue::insert(const Event & event)
{
    size_t new_item = generic_queue_.insert();
    if (tools::GenericQueue::INVALID_ITEM == new_item)
    {
        return false;
    }

    event_buffer_[new_item] = event;
    return true;
}

const Event * EventQueue::peek() const
{
    size_t item = generic_queue_.peek();
    if (tools::GenericQueue::INVALID_ITEM == item)
    {
        return nullptr;
    }

    return &(event_buffer_[item]);
}

}  // namespace system
