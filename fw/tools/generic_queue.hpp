/**
 * @file
 */

#ifndef TOOLS_GENERIC_QUEUE_HPP_
#define TOOLS_GENERIC_QUEUE_HPP_

#include <stdint.h>
#include <stddef.h>

namespace tools
{

/**
 * @brief Generic queue implementation
 */
class GenericQueue
{
public:
    static constexpr size_t INVALID_ITEM = -1;

    GenericQueue(size_t length = 0):
        capacity_(length),
        head_(0), tail_(0), is_not_empty_(0 == length)
    { }

    size_t capacity() const
    {
        return capacity_;
    }

    /**
     * @brief Empty the queue
     */
    void empty();

    /**
     * @brief Insert single item into the queue
     *
     * @return Position at which is the new item to be inserted
     * @retval INVALID_ITEM Not enough space in the queue
     */
    size_t insert();

    /**
     * @brief Peek the oldest item from the queue
     *
     * @return Position of the oldest item in the queue
     * @retval INVALID_ITEM No item in the queue
     */
    size_t peek() const;

    /**
     * @brief Remove the oldest item from the queue
     *
     * @return Success of the operation
     */
    bool remove();

private:
    size_t capacity_;

    size_t head_;
    size_t tail_;
    bool is_not_empty_;

    /**
     * @brief Check whether the queue is full
     *
     * @return Queue is full
     */
    bool isFull() const
    {
        return head_ == tail_ && is_not_empty_;
    }

    /**
     * @brief Check whether the queue is empty
     *
     * @return Queue is empty
     */
    bool isEmpty() const
    {
        return !is_not_empty_;
    }
};


}  // namespace tools



#endif  // TOOLS_GENERIC_QUEUE_HPP_
