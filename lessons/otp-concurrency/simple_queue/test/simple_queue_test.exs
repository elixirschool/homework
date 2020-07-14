defmodule SimpleQueueTest do
  use ExUnit.Case
  doctest SimpleQueue

  test "Task 1" do
    SimpleQueue.start_link([1,2,3])
    assert SimpleQueue.queue() == [1,2,3]
    assert SimpleQueue.enqueue(20) == 20
    assert SimpleQueue.queue() == [1,2,3,20]
  end

  test "Task 2" do
    SimpleQueue.start_link([1,2,3,4,5,6,7])
    assert SimpleQueue.sum() == 28
    assert SimpleQueue.queue() == [1,2,3,4,5,6,7] # State is not modified
  end
end
