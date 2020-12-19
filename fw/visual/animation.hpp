/**
 * @file
 */

#ifndef VISUAL_ANIMATION_HPP_
#define VISUAL_ANIMATION_HPP_

#include "visual/common.hpp"
#include "visual/led_chain.hpp"


namespace visual
{

class Animation
{
public:
    static constexpr uint8_t MAX_CONFIGURATION_LENGTH = 16;
    virtual void render(LedChain * chain, uint8_t time);


    virtual ~Animation() = default;
};

}  // namespace visual


#endif  // VISUAL_ANIMATION_HPP_
