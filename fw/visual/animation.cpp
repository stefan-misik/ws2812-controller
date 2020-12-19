#include "visual/animation.hpp"

namespace visual
{

void Animation::render(LedChain * chain, uint8_t time)
{
    LedChain::Led * const chain_end = chain->begin() + chain->length();
    for (LedChain::Led * led = chain->begin(); led != chain_end; ++led)
    {
        led->r = 0x00;
        led->g = 0x00;
        led->b = 0x00;
    }
}

}  // namespace visual
