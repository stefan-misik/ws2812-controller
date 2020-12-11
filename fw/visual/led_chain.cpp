#include "visual/led_chain.hpp"

#include <string.h>

namespace visual
{

size_t LedChain::render(uint8_t * buffer)
{
    size_t length = 3 * static_cast<size_t>(length_);
    memcpy(buffer, chain_, length);
    return length;
}

}  // namespace visual
