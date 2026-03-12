defmodule Petri do
  def ex1l do
    [
      [P0, A],
      [P1, B],
      [P1, D],
      [P2, C],
      [P2, D],
      [P3, E],
      [P4, E],
      [A, P1],
      [A, P2],
      [B,P3],
      [C,P4],
      [D,P3],
      [D,P4],
      [E,P5]
    ]
  end

  def ex1m do
    %{
      P0 => MapSet.new([A]),
      P1 => MapSet.new([B,D]),
      P2 => MapSet.new([C,D]),
      P3 => MapSet.new([E]),
      P4 => MapSet.new([E]),
      P5 => MapSet.new([]),
      A => MapSet.new([P1,P2]),
      B => MapSet.new([P3]),
      C => MapSet.new([P4]),
      D => MapSet.new([P3,P4]),
      E => MapSet.new([P5])
    }
  end

  # Funciones para la implementacion con lista
  def preset(f, n) do
    f
    |> Enum.filter(fn [_a, b] -> b == n end)
    |> Enum.map(fn [a, _b] -> a end)
    |> MapSet.new()
  end

  def postset(f, n) do
    f
    |> Enum.filter(fn [a, _b] -> a == n end)
    |> Enum.map(fn [_a, b] -> b end)
    |> MapSet.new()
  end

  def is_enabled(f, n, m)do
    MapSet.subset?(preset(f,n), m)
  end

  def fire(f, n, m) do
    if is_enabled(f, n, m) do
      m
      |> MapSet.difference(preset(f, n))
      |> MapSet.union(postset(f, n))
    else
      m
    end
  end

  #Funciones para la implementacion con mapa
  def preset_m(f, n) do
    f
    |> Enum.filter(fn {_a,b} -> MapSet.member?(b,n) end)
    |> Enum.map(fn {a,_b} -> a end)
    |> MapSet.new()
  end

  def postset_m(f, n) do
    Map.get(f, n)
  end

  def is_enable_m(f, n, m) do
    MapSet.subset?(preset_m(f,n), m)
  end

  def fire_m(f, n, m) do
    if is_enable_m(f, n, m) do
      m
      |> MapSet.difference(preset_m(f, n))
      |> MapSet.union(postset_m(f, n))
    else
      m
    end
  end

  #Funciones enablement
  def enablement(f, m) do
    all_nodes = f |> List.flatten() |> Enum.uniq()

    all_nodes
    |> Enum.filter(fn nodo ->
      p_set = preset(f, nodo)
      MapSet.size(p_set) > 0 and MapSet.subset?(p_set, m)
    end)
  end

  def enablement_m(f, m) do
    f
    |> Map.keys()
    |> Enum.filter(fn nodo ->
      p_set = preset_m(f, nodo)
      MapSet.size(p_set) > 0 and MapSet.subset?(p_set, m)
    end)
  end
end
