#include "system/display_object.hpp"

namespace system
{

uint8_t DisplayObject::processEvent(const Event & event, Event * new_event)
{
    return EventResult::EVENT_NOT_PROCESSED;
}

void DisplayObject::draw(DrawContext & dc)
{
    const uint8_t width = dc.drawArea().width();
    const uint8_t height = dc.drawArea().height();

    for (uint8_t y = 0; y != height; ++y)
    {
        uint8_t * data = dc.dataAt(0, y);
        for (uint8_t x = 0; x != width; ++x)
        {
            *data = 0x00;
            ++data;
        }
    }
}

}  // namespace system
