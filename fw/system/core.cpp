#include "system/core.hpp"
#include "system/draw_context.hpp"

namespace system
{

void Core::run()
{
    const Event * event;

    while ((event = event_queue_.peek()) != nullptr)
    {
        Event new_event;
        root_display_object_->processEvent(*event, &new_event);
        event_queue_.remove();
    }

    {
        DrawContext dc(frame_buffer_, Rectangle{});
        root_display_object_->draw(dc);
    }

    clock_.tick();
}

}  // namespace system
