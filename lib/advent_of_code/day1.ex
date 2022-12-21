defmodule AdventOfCode.Day1 do
  @moduledoc """
  Solves the day 1 challenge.

  Returns a tuple with the Elf index being the first as 0 and the number of calories that Elf is carrying
  """

  @spec solve(String.t()) :: {:ok, integer(), integer()} | {:error, term()}
  def solve(input) when is_binary(input) do
    highest_calories =
      input
      |> String.trim()
      |> String.split("\n\n")
      |> Enum.map(&parse_input_line/1)
      |> get_highest_calories()

    {:ok, highest_calories.elf, highest_calories.total_calories}
  end

  defp parse_input_line(line) when is_binary(line) do
    line
    |> String.split("\n")
    |> Enum.map(&String.to_integer/1)
  end

  defp get_highest_calories([first_calories | rest]) do
    initial_state =
      {1,
       %{
         elf: 0,
         total_calories: Enum.sum(first_calories)
       }}

    {_index, highest_calories} =
      Enum.reduce(rest, initial_state, fn calories, {index, highest} ->
        sum = Enum.sum(calories)

        highest_calories =
          if sum > highest.total_calories,
            do: %{elf: index, total_calories: sum},
            else: highest

        {index + 1, highest_calories}
      end)

    highest_calories
  end
end
