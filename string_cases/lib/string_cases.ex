defmodule StringCases do
  @moduledoc """
  A collection of functions for changing the casing of string values
  """

  @doc """
  Take an input and return it as a properly formatted CamelCased string.
  Spaces and punctuation should be removed and the first letter of each word capitalized.

  # Examples

  iex> StringCase.camel_case("Elixir-School is awesome!")
  ElixirSchoolIsAwesome
  """
  def camel_case(input) do
  end

  @doc """
  snake_case the inputed string value.
  The resulting string should not include any punctuation other than underscores.
  Spaces are replaced with underscores and words are downcased.

  # Examples

  iex> StringCase.snake_case("Elixir-School is awesome!")
  elixir_school_is_awesome
  """
  def snake_case(input) do
  end

  @doc """
  Everyone's favorite!  Wavy case alternates uppercase and downcased letters started with a capitalize letter.

  # Examples

  iex> StringCase.wavey_case("Elixir-School is awesome!")
  ElIxIrScHoOlIsAwEsOmE
  """
  def wavey_case(input) do
  end
end
