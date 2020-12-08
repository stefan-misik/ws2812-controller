#include <CppUTest/TestHarness.h>
#include <CppUTestExt/MockSupport.h>

#include "test_common.h"

#include "tools/generic_queue.hpp"

TEST_GROUP(ToolsGenericQueue)
{
    tools::GenericQueue * tested_queue;
    size_t INVALID_ITEM = tools::GenericQueue::INVALID_ITEM;

    TEST_SETUP()
    {
        tested_queue = new tools::GenericQueue(3);
    }

    TEST_TEARDOWN()
    {
        delete tested_queue;
        tested_queue = nullptr;
    }

    void insertN(size_t count)
    {
        for (; count > 0; --count)
        {
            if (INVALID_ITEM == tested_queue->insert())
            {
                FAIL("Failed to insert item");
            }
        }
    }

    void removeN(size_t count)
    {
        for (; count > 0; --count)
        {
            if (!tested_queue->remove())
            {
                FAIL("Failed to remove item");
            }
        }
    }
};

TEST(ToolsGenericQueue, Capacity)
{
    UNSIGNED_LONGS_EQUAL(3, tested_queue->capacity());
}

TEST(ToolsGenericQueue, AddFirstItem)
{
    UNSIGNED_LONGS_EQUAL(0, tested_queue->insert());
}

TEST(ToolsGenericQueue, AddSecondItem)
{
    insertN(1);
    UNSIGNED_LONGS_EQUAL(1, tested_queue->insert());
}

TEST(ToolsGenericQueue, AddFullItem)
{
    insertN(2);
    UNSIGNED_LONGS_EQUAL(2, tested_queue->insert());
}

TEST(ToolsGenericQueue, AddMoreThanCapacityOfTheQueue)
{
    insertN(3);
    UNSIGNED_LONGS_EQUAL(INVALID_ITEM, tested_queue->insert());
}

TEST(ToolsGenericQueue, PeekIntoEmptyQueue)
{
    UNSIGNED_LONGS_EQUAL(INVALID_ITEM, tested_queue->peek());
}

TEST(ToolsGenericQueue, RemoveFromEmptyQueue)
{
    CHECK_FALSE(tested_queue->remove());
}

TEST(ToolsGenericQueue, AddOneItemAfterWrappingAround)
{
    insertN(3);
    removeN(1);
    UNSIGNED_LONGS_EQUAL(0, tested_queue->insert());
}

TEST(ToolsGenericQueue, AddMoreThanCapacityAfterWrappingAround)
{
    insertN(3);
    removeN(1);
    insertN(1);
    UNSIGNED_LONGS_EQUAL(INVALID_ITEM, tested_queue->insert());
}

TEST(ToolsGenericQueue, PeekItemAfterWrappingAround)
{
    insertN(3);
    removeN(1);
    insertN(1);
    removeN(2);
    UNSIGNED_LONGS_EQUAL(0, tested_queue->peek());
}

TEST(ToolsGenericQueue, RemoveLastItemAfterWrappingAround)
{
    insertN(3);
    removeN(1);
    insertN(1);
    removeN(2);
    CHECK_TRUE(tested_queue->remove());
    UNSIGNED_LONGS_EQUAL(INVALID_ITEM, tested_queue->peek());
}

TEST(ToolsGenericQueue, CanNotRemoveMoreThanAvailableItemsAfterWrappingAround)
{
    insertN(3);
    removeN(1);
    insertN(1);
    removeN(3);
    CHECK_FALSE(tested_queue->remove());
}

TEST(ToolsGenericQueue, PeekFromEmptiedQueue)
{
    insertN(3);
    tested_queue->empty();
    UNSIGNED_LONGS_EQUAL(INVALID_ITEM, tested_queue->peek());
}
