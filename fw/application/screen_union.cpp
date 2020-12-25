#include "application/screen_union.hpp"
#include "application/core.hpp"

inline void * operator new(size_t size, void * ptr)
{
    return ptr;
}

namespace application
{

ScreenUnion::ScreenUnion():
        active_screen_(Screen::STARTUP)
{
    new (screen_data_) StartupScreen();
}

void ScreenUnion::changeScreen(Screen new_screen)
{
    activeScreenObject()->~DisplayObject();

    switch (new_screen)
    {
    case Screen::STARTUP:
        new (screen_data_) StartupScreen();
        break;

    case Screen::CONTROL:
        new (screen_data_) ControlScreen();
        break;

    case Screen::SETTINGS:
        new (screen_data_) SettingsScreen();
        break;
    }

    active_screen_ = new_screen;
}

}  // namespace application
