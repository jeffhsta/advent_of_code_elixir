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
  def solve_part2(input) do
    first_basement_entry_index =
      input
      |> String.trim()
      |> String.split("")
      |> Enum.reject(&(&1 == ""))
      |> Enum.with_index()
      |> Enum.reduce({:looking, 0}, &find_first_basement_entry_index/2)
      |> case do
        {:found, index} -> index + 1
        {:looking, _} -> 0
      end

    {:ok, first_basement_entry_index}
  end

  defp up_or_down_floors("(", floor), do: floor + 1
  defp up_or_down_floors(")", floor), do: floor - 1
  defp up_or_down_floors(_char, floor), do: floor

  defp find_first_basement_entry_index({"(", _index}, {:looking, floor}) do
    {:looking, floor + 1}
  end

  defp find_first_basement_entry_index({")", index}, {:looking, floor}) do
    next_floor = floor - 1

    if next_floor == -1,
      do: {:found, index},
      else: {:looking, next_floor}
  end

  defp find_first_basement_entry_index(_item, state), do: state
end
