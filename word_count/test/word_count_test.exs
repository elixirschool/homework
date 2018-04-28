defmodule WordCountTest do
  use ExUnit.Case
  doctest WordCount

  describe "read/1" do
    test "returns {:ok, file_contents} for valid files" do
      assert {:ok, _contents} = WordCount.read("./priv/charge_of_the_light_brigade.txt")
    end

    test "returns an error tuple when the file is missing" do
      assert {:error, :enoent} = WordCount.read("doesnotexist.txt")
    end
  end

  describe "parse/1" do
    test "returns a list of words without special characters" do
      parsed_words = WordCount.parse({:ok, "This is our Test's sentence"})
      assert ["this", "is", "our", "tests", "sentence"] == parsed_words
    end

    test "passes error tuples through" do
      assert {:error, "pass-through"} == WordCount.parse({:error, "pass-through"})
    end
  end

  describe "sum_words/1" do
    test "returns a map of words and their occurrences" do
      counted_words = WordCount.sum_words(["one", "two", "two", "three"])
      assert %{"one" => 1, "two" => 2, "three" => 1} == counted_words
    end

    test "passes error tuples through" do
      assert {:error, "pass-through"} == WordCount.sum_words({:error, "pass-through"})
    end
  end

  describe "top10/1" do
    test "returns a the top 10 most frequent words as a list of tuples" do
      example_words =
        %{"a" => 1, "b" => 10, "c" => 2, "d" => 5, "e" => 6, "f" => 11,  "g" => 12, "h" => 3, "i" => 0, "j" => 9, "k" => 19}

      expected_result = [
        {"k", 19},
        {"g", 12},
        {"f", 11},
        {"b", 10},
        {"j", 9},
        {"e", 6},
        {"d", 5},
        {"h", 3},
        {"c", 2},
        {"a", 1}
      ]

      assert expected_result == WordCount.top10(example_words)
    end

    test "returns 'File not found' for :enoent errors" do
      assert "File not found" == WordCount.top10({:error, :enoent})
    end

    test "returns 'Unexpected error' for all other errors" do
      assert "Unexpected error" == WordCount.top10({:error, "something is wrong"})
    end
  end
end
