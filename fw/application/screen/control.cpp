#include "application/screen/control.hpp"


namespace application
{

uint8_t ControlScreen::processEvent(
        const system::Event & event,
        system::Event * new_event)
{
    return system::DisplayObject::EVENT_PROCESSED;
}

void ControlScreen::draw(system::DrawContext & dc, uint8_t time)
{
}

}  // namespace application
