defmodule PalindromeTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  test "generates all possible palindrome permutations" do
    fun = fn -> Palindrome.run("aabbbdd") end
    assert capture_io(fun) == "dbababd\nbdabadb\nadbbbda\ndabbbad\nbadbdab\nabdbdba\n"
  end
end
