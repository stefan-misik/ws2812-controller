/**
 * @file
 */

#ifndef SYSTEM_FRAME_BUFFER_HPP_
#define SYSTEM_FRAME_BUFFER_HPP_

#include "system/common.hpp"

namespace system
{

class FrameBuffer
{
public:
    static constexpr size_t SIZE = 504;

    FrameBuffer()
    {
        clear();
    }

    uint8_t * begin() { return buffer_; }
    uint8_t * end() { return buffer_ + SIZE; }
    const uint8_t * begin() const { return buffer_; }
    const uint8_t * end() const { return buffer_ + SIZE; }

    void clear();

private:
    uint8_t buffer_[SIZE];
};

}  // namespace system



#endif  // SYSTEM_FRAME_BUFFER_HPP_
