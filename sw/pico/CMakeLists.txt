cmake_minimum_required(VERSION 3.13)

set(PROJ led_controller)
set(PICO_BOARD "pico_w")

set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

include($ENV{PICO_SDK_PATH}/external/pico_sdk_import.cmake)

project(${PROJ} C CXX ASM)

# Initialize the Raspberry Pi Pico SDK
pico_sdk_init()

add_executable(${PROJ}
    main.cpp
    status_led.cpp
)
# Make binary files
pico_add_extra_outputs(${PROJ})

# Libraries
target_link_libraries(${PROJ}
    pico_stdlib
    hardware_pio
    hardware_timer
    hardware_clocks
    hardware_pwm
    pico_multicore
)

# Configure STD IO
pico_enable_stdio_usb(${PROJ} 1)
pico_enable_stdio_uart(${PROJ} 0)

# no_flash means the target is to run from RAM
pico_set_binary_type(${PROJ} no_flash)

