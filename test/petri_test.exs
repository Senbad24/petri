defmodule PetriTest do
  use ExUnit.Case
  doctest Petri

  test "greets the world" do
    assert Petri.hello() == :world
  end
end
