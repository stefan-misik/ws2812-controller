#include "application/screen/settings.hpp"


namespace application
{

uint8_t SettingsScreen::processEvent(
        const system::Event & event,
        system::Event * new_event)
{
    return system::DisplayObject::EVENT_NOT_PROCESSED;
}

void SettingsScreen::draw(system::DrawContext & dc)
{
    system::DrawContext::TextProperties tp;

    char buffer[16];

    for (uint8_t j = 0; j < 5; ++j)
    {
        for (uint8_t i = 0; i < 14; ++i)
        {
            buffer[i] = 0x20 + (i + (j * 14));
        }
        buffer[14] = '\0';

        dc.drawText(0, j, buffer, &tp);
    }
}

}  // namespace application
