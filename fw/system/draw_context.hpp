/**
 * @file
 */

#ifndef SYSTEM_DRAW_CONTEXT_HPP_
#define SYSTEM_DRAW_CONTEXT_HPP_

#include "system/common.hpp"
#include "system/frame_buffer.hpp"

namespace system
{

/**
 * @brief Interface used to draw on the display
 */
class DrawContext
{
public:
    struct TextProperties;

    DrawContext(const DrawContext &) = default;

    DrawContext(FrameBuffer & frame_buffer, const Rectangle & draw_area):
        frame_buffer_(frame_buffer.begin()),
        draw_area_(draw_area)
    { }

    const Rectangle & drawArea() const { return draw_area_; }

    /**
     * @brief Get the pointer to the data at given position in the draw area
     *
     * @param x X coordinate relative to the draw area
     * @param y Y coordinate relative to the draw area
     *
     * @return Pointer to the data in the frame buffer
     * @retval nullptr Requested coordinates are not within the draw area
     */
    uint8_t * dataAt(uint8_t x, uint8_t y) const;

    /**
     * @brief Draw text with given optional properties
     *
     * @param x X coordinate of the text
     * @param y Y coordinate of the text
     * @param[in] text Zero-terminated string to be printed
     * @param[in] text_properties Optional properties
     *
     * @return Number of characters that were fully drawn (or skipped by offset)
     */
    size_t drawText(
            uint8_t x, uint8_t y,
            const char * text,
            const TextProperties * text_properties = nullptr) const;

private:
    uint8_t * frame_buffer_;
    Rectangle draw_area_;

    /**
     * @brief Calculate the width that wits within draw area
     *
     * @param x X coordinate
     * @param width Desired width
     *
     * @return Width that fits within the draw area
     */
    uint8_t widthWithin(uint8_t x, uint8_t width) const;
};


struct DrawContext::TextProperties
{
    enum TextFlags: uint8_t
    {
        FLAG_BLEND_SET = 0,
        FLAG_BLEND_OR = (1 << 0),
        FLAG_BLEND_AND = (1 << 1),
        FLAG_BLEND_XOR = (1 << 0) | (1 << 1),
        FLAG_BLEND_MASK = (1 << 0) | (1 << 1),
        FLAG_BOLD = (1 << 2),
        FLAG_INVERT = (1 << 3),
    };

    TextProperties():
        offset(0),
        max_width(DISPLAY_WIDTH),
        flags(0)
    { }

    /**
     * @brief Offset from the start of the text to start drawing from in pixels
     */
    size_t offset;
    uint8_t max_width;  /**< Maximum width of the text in pixels */
    uint8_t flags;  /**< Special flags modifying the rendering */
};

}  // namespace system



#endif  // SYSTEM_DRAW_CONTEXT_HPP_
