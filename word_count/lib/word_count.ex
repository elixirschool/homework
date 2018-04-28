defmodule WordCount do
  @moduledoc """

  ## Examples

  iex> WordCount.run("./priv/be-proud-of-who-you-are.txt")
  [
    {"i", 7},
    {"to", 5},
    {"my", 3},
    {"and", 3},
    {"me", 3},
    {"when", 3},
    {"be", 3},
    {"a", 2},
    {"am", 2},
    {"can", 2}
  ]

  iex> WordCount.run("nonexistant.txt")
  "File not found"
  """

  def run(file) do
    file
    |> read()
    |> parse()
    |> sum_words()
    |> top10()
  end

  defp read(file), do: File.read(file)
end
