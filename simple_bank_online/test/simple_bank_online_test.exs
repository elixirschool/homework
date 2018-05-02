defmodule SimpleBankOnlineTest do
  use ExUnit.Case
  doctest SimpleBankOnline

  test "greets the world" do
    assert SimpleBankOnline.hello() == :world
  end
end
