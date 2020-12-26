#include "application/screen/settings.hpp"


namespace application
{

uint8_t SettingsScreen::processEvent(
        const system::Event & event,
        system::Event * new_event)
{
    return system::DisplayObject::EVENT_NOT_PROCESSED;
}

void SettingsScreen::draw(system::DrawContext & dc, uint8_t time)
{
}

}  // namespace application
