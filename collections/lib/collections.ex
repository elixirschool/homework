defmodule Collections do
  @moduledoc """
  Functions for working with manipulating and retrieving data from within
  collecitons.
  """

  @doc """
  Capitalize all of the words in a list.

  # Examples

  iex> Collections.capitalize(["elixir", "rocks"])
  ["Elixir", "Rocks"]

  """
  def capitalize(words) do
  end


  @doc """
  Given a list of numbers return only the even numbers.

  # Examples

  iex> Collections.even([1, 2, 3, 4, 5, 6])
  [2, 4, 6]

  """
  def even(numbers) do
  end


  @doc """
  Return the longest word in a list.

  # Examples

  iex> Collections.long_word(["we", "the", "people"])
  "people"

  """
  def long_word(words) do
  end

  @doc """
  Group a collection of persons together by their age group (0-10, 10-20, 20-30, etc).

  # Examples

  iex> Collections.age_groups([%{name: "Sean", age: 33}, %{name: "Sarah", age: 33}, %{name: "Darren", age: 51}])
  %{"30-40" => ["Sean", "Sarah"], "50-60" => ["Darren"]}
  """

  def age_groups(persons) do
  end
end
