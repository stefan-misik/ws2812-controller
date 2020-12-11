/**
 * @file
 */

#ifndef SYSTEM_CORE_HPP_
#define SYSTEM_CORE_HPP_

#include "system/event_queue.hpp"
#include "system/input.hpp"
#include "system/frame_buffer.hpp"

namespace system
{

class Core
{
public:
    Core():
        input_(&event_queue_)
    { }

    /**
     * @brief Periodic system run method
     *
     * This method is to be called exactly 10ms.
     */
    void run();

    EventQueue & eventQueue()
    {
        return event_queue_;
    }

    Input & input()
    {
        return input_;
    }

    FrameBuffer & frameBuffer()
    {
        return frame_buffer_;
    }

private:
    /** @brief Main system event queue */
    EventQueue event_queue_;

    /** @brief Main input component */
    Input input_;

    /** @brief Main LCD frame buffer */
    FrameBuffer frame_buffer_;
};

}  // namespace system



#endif  // SYSTEM_CORE_HPP_
