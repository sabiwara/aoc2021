defmodule AoC2021.Day2 do
  @doc """
  Part 1: get depth & horizontal position product
  """
  @spec part1(list(String.t())) :: integer()
  def part1(course) do
    do_part1(course, 0, 0)
  end

  defp do_part1([], horizontal, depth), do: horizontal * depth

  defp do_part1([head | tail], horizontal, depth) do
    case head do
      "forward " <> forward ->
        do_part1(tail, horizontal + String.to_integer(forward), depth)

      "down " <> down ->
        do_part1(tail, horizontal, depth + String.to_integer(down))

      "up " <> up ->
        do_part1(tail, horizontal, depth - String.to_integer(up))
    end
  end

  @doc """
  Part 2: get depth & horizontal position product, adjusting the aim
  """
  @spec part2(list(String.t())) :: integer()
  def part2(course) do
    do_part2(course, 0, 0, 0)
  end

  defp do_part2([], _aim, horizontal, depth), do: horizontal * depth

  defp do_part2([head | tail], aim, horizontal, depth) do
    case head do
      "forward " <> forward ->
        distance = String.to_integer(forward)
        do_part2(tail, aim, horizontal + distance, depth + aim * distance)

      "down " <> down ->
        do_part2(tail, aim + String.to_integer(down), horizontal, depth)

      "up " <> up ->
        do_part2(tail, aim - String.to_integer(up), horizontal, depth)
    end
  end

  @spec get_data :: list(String.t())
  def get_data do
    "fixtures/day2.txt"
    |> File.read!()
    |> String.split("\n")
  end

  def run do
    data = get_data()

    data |> part1() |> IO.inspect(label: "Part1")
    data |> part2() |> IO.inspect(label: "Part2")
  end
end
