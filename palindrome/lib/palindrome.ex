defmodule Palindrome do
  @moduledoc """
  Given a string of characters determine all of the valid palindrome permutations
  and print them to IO.
  """

  @spec run(String.t) :: :ok

  def run(str) do
    str
    |> tokenize()
    |> generate()
    |> print()
  end
end
