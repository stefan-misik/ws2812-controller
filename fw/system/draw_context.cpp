#include "system/draw_context.hpp"

#include <avr/pgmspace.h>

#include "system/gui/font.inc"

namespace system
{

size_t DrawContext::measureTextWidth(const char * text, uint8_t flags)
{
    size_t length = 0;
    while ('\0' != ((FLAG_FROM_PROGMEM & flags) ? pgm_read_byte(text) : *text))
    {
        ++length;
        ++text;
    }
    return length * ((FLAG_TEXT_BOLD & flags) ? 7 : 6);
}

void DrawContext::changeSubDrawArea(
        const Rectangle & sub_draw_area,
        Rectangle * original_draw_area)
{
    if (original_draw_area)
    {
        *original_draw_area = draw_area_;
    }

    draw_area_.left += sub_draw_area.left;
    draw_area_.top += sub_draw_area.top;
    draw_area_.right = draw_area_.left + sub_draw_area.right;
    draw_area_.bottom = draw_area_.top + sub_draw_area.bottom;
}

uint8_t * DrawContext::dataAt(uint8_t x, uint8_t y) const
{
    uint16_t actual_x = draw_area_.left + x;
    uint16_t actual_y = draw_area_.top + y;

    if (actual_x >= draw_area_.right || actual_y >= draw_area_.bottom)
    {
        return nullptr;
    }

    return &(frame_buffer_[(actual_y * DISPLAY_WIDTH) + actual_x]);
}

size_t DrawContext::drawText(
        uint8_t x, uint8_t y,
        const char * text,
        const TextProperties * text_properties) const
{
    const char * const text_start = text;
    uint8_t width = DISPLAY_WIDTH;
    uint8_t glyph_offset = 0;
    uint8_t flags = 0;

    uint8_t * draw_out = dataAt(x, y);
    if (nullptr == draw_out)
    {
        return 0;
    }

    // Modify behavior based on passed properties
    if (nullptr != text_properties)
    {
        width = text_properties->max_width;
        flags = text_properties->flags;
        if (0 != text_properties->offset)
        {
            const uint8_t char_width = FLAG_TEXT_BOLD & flags ? 7 : 6;
            size_t skip_characters = text_properties->offset / char_width;
            glyph_offset = text_properties->offset -
                    (skip_characters * char_width);
            text = text + skip_characters;
        }
    }

    // Start drawing the text
    uint8_t * const draw_end = draw_out + widthWithin(x, width);
    const uint8_t blend_type  = flags & FLAG_BLEND_MASK;
    char c;
    while ('\0' != (c = (flags & FLAG_FROM_PROGMEM ?
            pgm_read_byte(text) :
            *text)))
    {
        const uint8_t * const glyph_start_pgm =
                &(gui_base_font[c < 0x20 ?
                        0 : static_cast<uint8_t>(c) - 0x20][0]);

        uint8_t previous = (0 == glyph_offset || 6 == glyph_offset) ?
                0 : pgm_read_byte(glyph_start_pgm + glyph_offset - 1);
        while (true)
        {
            // Check the boundaries
            if (draw_out == draw_end)
            {
                // The text did not fit completely
                return text - text_start;
            }
            if (glyph_offset >= 5)
            {
                break;
            }

            // Prepare graphic data
            uint8_t current_graphics;
            {
                uint8_t glyph_data =
                        pgm_read_byte(glyph_start_pgm + glyph_offset);
                current_graphics = glyph_data;
                if (FLAG_TEXT_BOLD & flags)
                {
                    current_graphics |= previous;
                    previous = glyph_data;
                }
            }
            if (FLAG_INVERT & flags)
            {
                current_graphics = ~current_graphics;
            }

            // Write the graphic data
            switch (blend_type)
            {
            case FLAG_BLEND_SET:
                *draw_out = current_graphics;
                break;
            case FLAG_BLEND_OR:
                *draw_out |= current_graphics;
                break;
            case FLAG_BLEND_AND:
                *draw_out &= current_graphics;
                break;
            case FLAG_BLEND_XOR:
                *draw_out ^= current_graphics;
                break;
            }

            // Increment the position
            ++draw_out;
            ++glyph_offset;
        };

        // Finish the glyph
        if ((FLAG_TEXT_BOLD & flags) && 5 == glyph_offset)
        {
            uint8_t current_graphics = previous;
            if (FLAG_INVERT & flags)
            {
                current_graphics = ~current_graphics;
            }

            // Write the graphic data
            switch (blend_type)
            {
            case FLAG_BLEND_SET:
                *draw_out = current_graphics;
                break;
            case FLAG_BLEND_OR:
                *draw_out |= current_graphics;
                break;
            case FLAG_BLEND_AND:
                *draw_out &= current_graphics;
                break;
            case FLAG_BLEND_XOR:
                *draw_out ^= current_graphics;
                break;
            }
            ++draw_out;
        }

        // Glyph space
        {
            uint8_t current_graphics = 0;
            if (FLAG_INVERT & flags)
            {
                current_graphics = ~current_graphics;
            }

            // Write the graphic data
            switch (blend_type)
            {
            case FLAG_BLEND_SET:
                *draw_out = current_graphics;
                break;
            case FLAG_BLEND_OR:
                *draw_out |= current_graphics;
                break;
            case FLAG_BLEND_AND:
                *draw_out &= current_graphics;
                break;
            case FLAG_BLEND_XOR:
                *draw_out ^= current_graphics;
                break;
            }
            ++draw_out;
        }

        // Move to the next character
        glyph_offset = 0;
        ++text;
    }

    return text - text_start;
}

uint8_t DrawContext::drawBitmap(
        uint8_t x, uint8_t y,
        const uint8_t * bitmap, uint8_t length,
        uint8_t repeat_count, uint8_t flags) const
{
    uint8_t * draw_out = dataAt(x, y);
    if (nullptr == draw_out)
    {
        return 0;
    }
    uint8_t actual_length = widthWithin(x, length * repeat_count);
    uint8_t * const draw_end = draw_out + actual_length;
    const uint8_t * const bitmap_rend = bitmap - 1;
    const uint8_t * const bitmap_end = bitmap + length;

    const int8_t step = (flags & FLAG_BITMAP_REVERSE) ? -1 : 1;
    if (flags & FLAG_BITMAP_REVERSE)
    {
        bitmap = bitmap_end - 1;
    }

    const uint8_t blend_type  = flags & FLAG_BLEND_MASK;
    while (draw_out != draw_end)
    {
        uint8_t current_graphics = (flags & FLAG_FROM_PROGMEM) ?
                pgm_read_byte(bitmap) :
                *bitmap;

        if (FLAG_INVERT & flags)
        {
            current_graphics = ~current_graphics;
        }

        // Write the graphic data
        switch (blend_type)
        {
        case FLAG_BLEND_SET:
            *draw_out = current_graphics;
            break;
        case FLAG_BLEND_OR:
            *draw_out |= current_graphics;
            break;
        case FLAG_BLEND_AND:
            *draw_out &= current_graphics;
            break;
        case FLAG_BLEND_XOR:
            *draw_out ^= current_graphics;
            break;
        }

        // Increment the position
        ++draw_out;
        bitmap += step;
        if (bitmap == bitmap_end)
        {
            bitmap = bitmap_rend + 1;
        }
        else if (bitmap == bitmap_rend)
        {
            bitmap = bitmap_end - 1;
        }
    }

    return actual_length;
}

uint8_t DrawContext::widthWithin(uint8_t x, uint8_t width) const
{
    uint16_t end  = x + width;

    if (end > draw_area_.right)
    {
        end = draw_area_.right;
    }

    return end - x;
}

}  // namespace system
