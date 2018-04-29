defmodule MarkdownTest do
  use ExUnit.Case

  describe "parse/2" do
    test "supports header syntax" do
      assert "<h1>This is a test</h1>" == Markdown.parse("# This is a test")
      assert "<h4>Another test</h4>" == Markdown.parse("#### Another test")
    end

    test "supports italics" do
      assert "Uh, <i>hello</i>" == Markdown.parse("Uh, _hello_")
    end

    test "has support for bold emphasis" do
      assert "<b>No way!</b>" == Markdown.parse("**No way!**")
    end

    test "supports strikethough text" do
      assert "<del>No way!</del>" == Markdown.parse("~~strikethrough~~")
    end

    test "supports link tags" do
      parsed = Markdown.parse("[Elixir](https://elixirschool.com)")
      assert ~S(<a href="https://elixirschool.com">Elixir School</a>) == parsed
    end

    test "has support for image tags" do
      parsed = Markdown.parse("Image: ![image alt](https://example.com/img.png)")
      assert ~S(Image: <img alt="image alt" src="https://example.com/img.png">) == parsed
    end
  end
end
