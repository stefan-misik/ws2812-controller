#include "system/controls/tab.hpp"

#include <avr/pgmspace.h>


namespace system
{

static const uint8_t tab_edge[] PROGMEM =
{
    0x40, 0x3e, 0x01
};


uint8_t TabControl::processEvent(
        const system::Event & event,
        system::Event * new_event)
{
    if (Event::KEY_DOWN == event.type)
    {
        uint8_t old_tab = current_tab_;
        switch (static_cast<char>(event.sdata))
        {
        case KEY_LEFT:
            if (0 != current_tab_)
            {
                --current_tab_;
            }
            break;

        case KEY_RIGHT:
            if (current_tab_ < (tab_count_ - 1))
            {
                ++current_tab_;
            }
            break;

        default:
            break;
        }

        if (old_tab != current_tab_)
        {
            flags_ |= Control::Flags::PENDING_REDRAW;
            return EVENT_TAB_CHANGE;
        }
    }

    return EVENT_NOT_PROCESSED;
}

void TabControl::draw(system::DrawContext & dc, uint8_t time)
{
    flags_ &= ~Control::PENDING_REDRAW;
    if (current_tab_ >= tab_count_)
    {
        current_tab_ = tab_count_ - 1;
    }

    const uint8_t width = dc.drawArea().width();
    uint8_t pos = 0;

    pos += dc.drawBitmap(pos, 0, tab_edge, 1, ADDED_BORDER,
            DrawContext::FLAG_FROM_PROGMEM);
    pos += dc.drawBitmap(pos, 0, tab_edge, sizeof(tab_edge), current_tab_ + 1,
            DrawContext::FLAG_FROM_PROGMEM);
    pos += dc.drawBitmap(pos, 0, tab_edge + (sizeof(tab_edge) - 1), 1, 20,
            DrawContext::FLAG_FROM_PROGMEM);
    pos += dc.drawBitmap(pos, 0, tab_edge, sizeof(tab_edge),
            tab_count_ - current_tab_,
            DrawContext::FLAG_FROM_PROGMEM | DrawContext::FLAG_BITMAP_REVERSE);
    dc.drawBitmap(pos, 0, tab_edge, 1, width - pos,
            DrawContext::FLAG_FROM_PROGMEM);
}

}  // namespace system
