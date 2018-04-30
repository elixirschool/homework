# Shapes

We'll practice list comprehensions in this exercise by printing different shapes out given their sizes.

```elixir
iex> Shapes.square(5)
* * * * *
* * * * *
* * * * *
* * * * *
* * * * *

iex> Shapes.rectangle(5, 3)
* * *
*   *
*   *
*   *
* * *

iex> Shapes.rectangle(4, 8)
* * * * * * * *
*             *
*             *
* * * * * * * *

iex> Shapes.pyramid(5)
    *
   * *
  * * *
 * * * *
* * * * *

iex> Shapes.diamond(5)
    *
   * *
  * * *
 * * * *
* * * * *
 * * * *
  * * *
   * *
    *
```

Too easy?  Here are some bonus features you can implement:

- Allow the display character to be configured (ie. `Shapes.pyramid(5, character: "$")`)
- Add an option to fill or empty a shape (ie. `Shapes.pyramid(5, filled: false)`)

To verify your code works and the tests pass run:

```shell
$ mix test
```
