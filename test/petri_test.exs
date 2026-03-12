defmodule PetriTest do
  use ExUnit.Case
  doctest Petri

  test "Red de Petri usando listas" do
    red = Petri.ex1l()
    n = A
    m = MapSet.new([P0])

    resultado_esperado = MapSet.new([P1,P2])

    assert MapSet.equal?(Petri.fire(red,n,m), resultado_esperado)
  end

  test "Red de Petri usnado mapas" do
    red = Petri.ex1m()
    n = B
    m = MapSet.new([P1,P2])

    resultado_esperado = MapSet.new([P2,P3])

    assert MapSet.equal?(Petri.fire_m(red,n,m), resultado_esperado)
  end
end
