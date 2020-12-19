#include "visual/led_chain.hpp"

#include <string.h>

namespace visual
{

size_t LedChain::render(uint8_t ** buffer)
{
    size_t length = 3 * static_cast<size_t>(length_);

    // TODO(stefan.misik) Do the post processing

    *buffer = reinterpret_cast<uint8_t *>(chain_);
    return length;
}

}  // namespace visual
