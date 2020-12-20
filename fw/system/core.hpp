/**
 * @file
 */

#ifndef SYSTEM_CORE_HPP_
#define SYSTEM_CORE_HPP_

#include "system/clock.hpp"
#include "system/event_queue.hpp"
#include "system/input.hpp"
#include "system/frame_buffer.hpp"
#include "system/display_object.hpp"

namespace system
{

class Core
{
public:
    Core():
        input_(&event_queue_),
        root_display_object_(nullptr)
    { }

    /**
     * @brief Periodic system run method
     *
     * This method is to be called exactly every 10ms.
     */
    void run();

    Clock & clock() { return clock_; }
    EventQueue & eventQueue() { return event_queue_; }
    Input & input() { return input_; }
    FrameBuffer & frameBuffer() { return frame_buffer_; }

    /**
     * @brief Set the root display object
     *
     * @param root_display_object Display object to act as the root object
     */
    void setRootDisplayObject(DisplayObject * root_display_object)
    {
        root_display_object_ = root_display_object;
    }

private:
    /** @brief Main system time-keeping */
    Clock clock_;

    /** @brief Main system event queue */
    EventQueue event_queue_;

    /** @brief Main input component */
    Input input_;

    /** @brief Main LCD frame buffer */
    FrameBuffer frame_buffer_;

    /** @brief The main object to handle events and draw on the display */
    DisplayObject * root_display_object_;
};

}  // namespace system



#endif  // SYSTEM_CORE_HPP_
