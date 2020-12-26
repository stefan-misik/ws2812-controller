#include "application/screen/startup.hpp"


namespace application
{

uint8_t StartupScreen::processEvent(
        const system::Event & event,
        system::Event * new_event)
{
    return system::DisplayObject::EVENT_NOT_PROCESSED;
}

void StartupScreen::draw(system::DrawContext & dc, uint8_t time)
{
}

}  // namespace application

