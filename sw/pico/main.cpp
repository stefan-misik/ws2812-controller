#include <cstdio>
#include "pico/stdlib.h"

int main() {
    setup_default_uart();
    std::printf("Hello, world!\n");
    return 0;
}
