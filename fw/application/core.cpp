#include "application/core.hpp"

namespace application
{

Text Core::text_;

uint8_t Core::processEvent(
        const system::Event & event,
        system::Event * new_event)
{
    return screen_union_.activeScreenObject()->processEvent(event, new_event);
}

void Core::draw(system::DrawContext & dc, uint8_t time)
{
    dc.drawText(0, 0, "Test");
    dc.changeSubDrawArea(
            system::Rectangle{0, 1,
        system::DISPLAY_HEIGHT, system::DISPLAY_HEIGHT});
    screen_union_.activeScreenObject()->draw(dc, time);
}


}  // namespace application
