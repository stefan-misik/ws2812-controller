/**
 * @file
 */

#ifndef APPLICATION_CORE_HPP_
#define APPLICATION_CORE_HPP_

#include "application/root_screen.hpp"
#include "application/settings.hpp"
#include "application/text.hpp"

namespace application
{

class Core
{
public:
    RootScreen & rootScreen() { return root_screen_; }
    Text & text() { return text_; }

private:
    RootScreen root_screen_;
    Text text_;
};

}  // namespace application


#endif  // APPLICATION_CORE_HPP_
