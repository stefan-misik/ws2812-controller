#include <CppUTest/TestRegistry.h>
#include <CppUTest/CommandLineTestRunner.h>
#include <CppUTestExt/MockSupportPlugin.h>

MockSupportPlugin mock_plugin;


int main(int ac, char** av)
{
    TestRegistry::getCurrentRegistry()->installPlugin(&mock_plugin);
    return CommandLineTestRunner::RunAllTests(ac, av);
}
