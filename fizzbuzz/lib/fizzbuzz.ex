defmodule Fizzbuzz do
  @doc """
  Any number divisible by three is replaced by the word fizz
  and any divisible by five by the word buzz.
  Numbers divisible by both become fizzbuzz.
  Numbers not divisible by three or five return unchanged.

  # Examples
  iex> Fizzbuzz.fizzbuzz(1)
  1
  iex> Fizzbuzz.fizzbuzz(3)
  "fizz"
  iex> Fizzbuzz.fizzbuzz(5)
  "buzz"
  iex> Fizzbuzz.fizzbuzz(30)
  "fizzbuzz"
  """

  def fizzbuzz(num) do
    cond do
      rem(num, 15) == 0 -> IO.puts "FizzBuzz"
      rem(num, 5) == 0  -> IO.puts "Buzz"
      rem(num, 3) == 0  -> IO.puts "Fizz"
      true              -> IO.puts num
    end
  end
end
