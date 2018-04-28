defmodule FibonacciTest do
  use ExUnit.Case
  doctest Fibonacci

  test "first step is not 0" do
    refute [0] == Fibonacci.run(1)
  end

  test "prints out 15 steps" do
    assert [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987] == Fibonacci.run(16)
  end
end
