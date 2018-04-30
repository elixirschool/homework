# StringCases

In this exercise we'll be implementing support for three string formatting functions:

- `camel_case/1`

  ```elixir
  iex> StringCases.camel_case("Elixir-School is awesome!")
  ElixirSchoolIsAwesome
  ```

- `snake_case/1`

  ```elixir
  iex> StringCases.snake_case("Elixir-School is awesome!")
  elixir_school_is_awesome
  ```

- `wavey_case/1`

  ```elixir
  iex> StringCases.wavey_case("Elixir-School is awesome!")
  ElIxIrScHoOlIsAwEsOmE
  ```

To verify your code works and the tests pass run:

```shell
$ mix test
```
