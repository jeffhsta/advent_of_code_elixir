defmodule AdventOfCode.Challenges.Year2015.Day1 do
  @moduledoc """
  Year 2015, Day 1 challenges
  """

  @behaviour AdventOfCode.Challenges.Behavior

  @impl true
  def solve_part1(input) do
    final_floor =
      input
      |> String.split("")
      |> Enum.reduce(0, &up_or_down_floors/2)

    {:ok, final_floor}
  end

  @impl true
  def solve_part2(_input) do
    {:ok, 0}
  end

  defp up_or_down_floors("(", floor), do: floor + 1
  defp up_or_down_floors(")", floor), do: floor - 1
  defp up_or_down_floors(_char, floor), do: floor
end
