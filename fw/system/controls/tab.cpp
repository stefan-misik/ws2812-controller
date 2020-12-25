#include "system/controls/tab.hpp"


namespace system
{

uint8_t TabControl::processEvent(
        const system::Event & event,
        system::Event * new_event)
{
    return EVENT_NOT_PROCESSED;
}

void TabControl::draw(system::DrawContext & dc, uint8_t time)
{
}


}  // namespace system
