defmodule AdventOfCode.Challenges.Behavior do
  @moduledoc """
  Defines the behavior for the challenges.
  """

  @callback solve_part1(String.t()) :: {:ok, integer() | String.t()}
  @callback solve_part2(String.t()) :: {:ok, integer() | String.t()}
end
