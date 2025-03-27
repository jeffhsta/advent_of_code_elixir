defmodule AdventOfCode.Challenges.Year2015.Day1Test do
  use ExUnit.Case, async: true

  alias AdventOfCode.Challenges.Year2015.Day1

  @moduletag :year2015

  describe "solve_part1/1" do
    test "returns value as 0" do
      input = "(())"

      assert Day1.solve_part1(input) == {:ok, 0}
    end

    test "returns value as 3" do
      input = "((("

      assert Day1.solve_part1(input) == {:ok, 3}
    end
  end

  describe "solve_part2/1" do
    test "returns zero value", %{input: input} do
      assert Day1.solve_part2(input) == {:ok, 0}
    end
  end
end
