# Markdown

In this exercise we implement a basic Markdown parser.
For now we will require our parser support the follow Markdown syntax:

- Headers: `#`, `##`, `###`, `####`, `#####`, `######`
- Italics: `_italics_`, `*italics*`
- Bold: `__bold__`, `**bold**`
- Strikethrough: `~~strikethrough~~`
- Links: `[Elixir](https://elixir-lang.org)`
- Images: `![Elixir Logo](https://elixir-lang.org/images/logo/logo.png)`

If you're looking to up the exercise difficulty try these bonus features:

+ Support option `:keep_lines` to retain newline characters
+ Add the ability to parse backquotes: `> Backquote`
+ Implement `document/2` to return a complete HTML document (`<html><head></head><body> ... </body></html>`) given a string of Markdown

To verify your code works and the tests pass run:

```shell
$ mix test
```
