#include "system/frame_buffer.hpp"


namespace system
{

void FrameBuffer::clear()
{
    for (uint8_t & c: *this)
    {
        c = 0x00;
    }
}

}  // namespace
