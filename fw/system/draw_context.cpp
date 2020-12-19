#include "system/draw_context.hpp"

#include "system/gui/font.inc"

namespace system
{

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
        return false;
    }

    // Modify behavior based on passed properties
    if (nullptr != text_properties)
    {
        width = text_properties->max_width;
        flags = text_properties->flags;
        if (0 != text_properties->offset)
        {
            const uint8_t char_width = TextProperties::FLAG_BOLD & flags ?
                    7 : 6;
            size_t skip_characters = text_properties->offset / char_width;
            glyph_offset = text_properties->offset -
                    (skip_characters * char_width);
            text = text + skip_characters;
        }
    }

    // Start drawing the text
    uint8_t * const draw_end = draw_out + widthWithin(x, width);
    const uint8_t blend_type  = flags & TextProperties::FLAG_BLEND_MASK;
    while ('\0' != *text)
    {
        const uint8_t * const glyph_start_pgm =
                &(gui_base_font[*text < 0x20 ?
                        0 : static_cast<uint8_t>(*text) - 0x20][0]);

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
                if (TextProperties::FLAG_BOLD & flags)
                {
                    current_graphics |= previous;
                    previous = glyph_data;
                }
            }
            if (TextProperties::FLAG_INVERT & flags)
            {
                current_graphics = ~current_graphics;
            }

            // Write the graphic data
            switch (blend_type)
            {
            case TextProperties::FLAG_BLEND_SET:
                *draw_out = current_graphics;
                break;
            case TextProperties::FLAG_BLEND_OR:
                *draw_out |= current_graphics;
                break;
            case TextProperties::FLAG_BLEND_AND:
                *draw_out &= current_graphics;
                break;
            case TextProperties::FLAG_BLEND_XOR:
                *draw_out ^= current_graphics;
                break;
            }

            // Increment the position
            ++draw_out;
            ++glyph_offset;
        };

        // Finish the glyph
        if ((TextProperties::FLAG_BOLD & flags) && 5 == glyph_offset)
        {
            *draw_out = previous;
            ++draw_out;
        }
        *draw_out = 0;
        ++draw_out;

        // Move to the next character
        glyph_offset = 0;
        ++text;
    }

    return text - text_start;
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
