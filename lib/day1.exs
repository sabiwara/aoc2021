defmodule AoC2021.Day1 do
  @doc """
  Part 1: count successive increases
  """
  @spec simple_count_increases(list(integer())) :: non_neg_integer()
  def simple_count_increases(_readings = [head | tail]) do
    do_count_increases(head, tail, 0)
  end

  defp do_count_increases(_last, [], acc), do: acc

  defp do_count_increases(last, [reading | rest], acc) do
    new_acc = if reading > last, do: acc + 1, else: acc
    do_count_increases(reading, rest, new_acc)
  end

  @doc """
  Part 2: count successive increases on a 3-sized sliding window
  """
  @spec sliding_count_increases(list(integer())) :: non_neg_integer()
  def sliding_count_increases(_readings = [a, b, c | rest]) do
    do_sliding_count_increases(a, b, c, rest, 0)
  end

  defp do_sliding_count_increases(_a, _b, _c, [], acc), do: acc

  defp do_sliding_count_increases(a, b, c, [d | rest], acc) do
    new_acc = if d > a, do: acc + 1, else: acc
    do_sliding_count_increases(b, c, d, rest, new_acc)
  end

  @spec get_readings :: list(integer())
  def get_readings do
    "fixtures/day1.txt"
    |> File.read!()
    |> String.split()
    |> Enum.map(&String.to_integer/1)
  end
end

readings = AoC2021.Day1.get_readings()

readings
|> AoC2021.Day1.simple_count_increases()
|> IO.inspect(label: "Part1")

readings
|> AoC2021.Day1.sliding_count_increases()
|> IO.inspect(label: "Part2")
