#include "system/controls/tab.hpp"

#include <avr/pgmspace.h>


namespace system
{

static const uint8_t tab_edge_left[] PROGMEM =
{
    0x6a, 0x7f
};

static const uint8_t tab_edge_right[] PROGMEM =
{
    0x7f, 0x7f, 0x7c
};

static const uint8_t tab_background[] PROGMEM =
{
    0x6a, 0x55
};

static const uint8_t tab_foreground[] PROGMEM =
{
    0x00
};

static const uint8_t tab_foreground_focus[] PROGMEM =
{
    0x7f
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

    // Fix the current tab ID, in case the tab count changed
    if (current_tab_ >= tab_count_)
    {
        current_tab_ = tab_count_ - 1;
    }

    DrawContext::TextProperties tp;
    tp.flags |= DrawContext::FLAG_TEXT_BOLD;
    if (TEXT_IN_PROGMEM & flags_)
    {
        tp.flags |= DrawContext::FLAG_FROM_PROGMEM;
    }
    tp.max_width = (nullptr != text_) ?
            system::DrawContext::measureTextWidth(text_, tp.flags) : 0;

    const uint8_t graphics_width = calculateTabGraphicsWidth();
    const uint8_t width = dc.drawArea().width();

    // Adapt text width
    if (graphics_width + tp.max_width > width)
    {
        tp.max_width = width - graphics_width;
    }

    // Draw
    const uint8_t text_position = drawTabs(dc, tp.max_width);
    if (flags_ & HAS_FOCUS)
    {
        tp.flags |= DrawContext::FLAG_BLEND_AND | DrawContext::FLAG_INVERT;
    }
    dc.drawText(text_position, 0, text_, &tp);
}

uint8_t TabControl::calculateTabGraphicsWidth() const
{
    uint8_t width = 0;

    // Left and right margin
    width += (2 * TAB_ADD_MARGIN) + (sizeof(tab_background) * current_tab_);
    // Left tab edge
    width += sizeof(tab_edge_left);
    // Left and right padding
    width += 2 * TAB_PADDING;
    // Right tab edge
    width += sizeof(tab_edge_right);

    return width;
}

uint8_t TabControl::drawTabs(
        const system::DrawContext & dc,
        uint8_t text_width) const
{
    const uint8_t width = dc.drawArea().width();
    uint8_t text_pos;

    // Background
    dc.drawBitmap(0, 0, tab_background, sizeof(tab_background),
            (width / sizeof(tab_background)) + 1,
            DrawContext::FLAG_FROM_PROGMEM);

    uint8_t pos;
    // Left margin
    pos = TAB_ADD_MARGIN + (sizeof(tab_background) * current_tab_);
    // Left tab edge
    pos += dc.drawBitmap(pos, 0, tab_edge_left, sizeof(tab_edge_left), 1,
            DrawContext::FLAG_FROM_PROGMEM | DrawContext::FLAG_BLEND_OR);
    // Space for the text
    text_pos = pos + TAB_PADDING;
    pos += dc.drawBitmap(pos, 0,
            (flags_ & HAS_FOCUS) ? tab_foreground_focus : tab_foreground, 1,
            text_width + (2 * TAB_PADDING),
            DrawContext::FLAG_FROM_PROGMEM);
    // Right tab edge
    pos += dc.drawBitmap(pos, 0, tab_edge_right, sizeof(tab_edge_right), 1,
            DrawContext::FLAG_FROM_PROGMEM | DrawContext::FLAG_BLEND_OR);

    return text_pos;
}

}  // namespace system
