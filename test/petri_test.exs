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

  test "Prueba enablement lista" do
    red = Petri.ex1l()
    m = MapSet.new([P0,P1])

    resultado_esperado = MapSet.new([A,B])
    res = MapSet.new(Petri.enablement(red,m))
    assert MapSet.equal?(res, resultado_esperado)
  end

  test "Prueba enablement mapa" do
    red = Petri.ex1m()
    m = MapSet.new([P0,P1])

    resultado_esperado = MapSet.new([A,B])
    res = MapSet.new(Petri.enablement_m(red,m))
    assert MapSet.equal?(res, resultado_esperado)
  end
end
