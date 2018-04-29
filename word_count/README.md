# Word Count

Using the poem _Be Proud of Who You Are_ ([Source](https://www.familyfriendpoems.com/poem/be-proud-of-who-you-are) as your input count the occurrances of each word and return them in order of most frequent to least.

```elixir
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
```

In addition to practicing problem solving, this exercise also helps us practice program composition the "Elixir way".  To help with there is a particular flow set in place and a robust test suite to help guide your implementation.

To verify your code works and the tests pass run:

```shell
$ mix test
```
