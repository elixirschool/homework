# Collections

This exercise will require you implement a number of different functions that act on collections.


- Capitalize all of the words in a given list

  ```elixir
  iex> Collections.capitalize(["elixir", "rocks"])
  ["Elixir", "Rocks"]
  ```

- The function `even/1` should return only the even numbers in a list

  ```elixir
  iex> Collections.even([1, 2, 3, 4, 5, 6])
  [2, 4, 6]
  ```

- Use `long_word/1` to find the word with the greatest length in a list

  ```elixir
  iex> Collections.long_word(["we", "the", "people"])
  "people"
  ```

-  Given a list of people put them into their respective age groups (0-10, 10-20, 20-30, etc).

  ```elixir
  iex> Collections.age_groups([%{name: "Sean", age: 33}, %{name: "Sarah", age: 33}, %{name: "Darren", age: 51}])
  %{"30-40" => ["Sean", "Sarah"], "50-60" => ["Darren"]}
  ```

To verify your code works and the tests pass run:

```shell
$ mix test
```
