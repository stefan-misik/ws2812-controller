/**
 * @file
 */

#ifndef SYSTEM_EVENT_QUEUE_HPP_
#define SYSTEM_EVENT_QUEUE_HPP_

#include "system/common.hpp"
#include "tools/generic_queue.hpp"

namespace system
{

/**
 * @brief Queue which stores system events in FIFO order
 */
class EventQueue
{
public:
    static constexpr size_t QUEUE_LENGTH = 8;

    EventQueue():
        generic_queue_(QUEUE_LENGTH)
    { }

    /** @brief Empty all the queued events */
    void empty()
    {
        generic_queue_.empty();
    }

    /**
     * @brief Insert a new event into the queue
     *
     * @param[in] event Event to be entered into the queue
     *
     * @return Success of the operation
     * @retval false Not enough space in the queue
     */
    bool insert(const Event & event);

    /**
     * @brief Peek an oldest event in the queue
     *
     * @return Pointer to the event
     * @retval nullptr no new events in the queue
     */
    const Event * peek() const;

    /**
     * @brief Remove the oldest event from the queue
     *
     * @return Success of the operation
     * @retval false No event in the queue to remove
     */
    bool remove()
    {
        return generic_queue_.remove();
    }

private:
    Event event_buffer_[QUEUE_LENGTH];
    tools::GenericQueue generic_queue_;
};

}  // namespace system



#endif  // SYSTEM_EVENT_QUEUE_HPP_
