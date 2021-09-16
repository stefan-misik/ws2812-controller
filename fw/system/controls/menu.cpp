#include "system/controls/menu.hpp"

namespace system
{


uint8_t MenuControl::processEvent(
        const system::Event & event,
        system::Event * new_event)
{
    return EVENT_NOT_PROCESSED;
}

void MenuControl::draw(system::DrawContext & dc)
{
}

}  // namespace system
