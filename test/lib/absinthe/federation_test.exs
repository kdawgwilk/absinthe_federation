defmodule Absinthe.FederationTest do
  use ExUnit.Case
  doctest Absinthe.Federation

  test "greets the world" do
    assert Absinthe.Federation.hello() == :world
  end
end
