defmodule AdventOfCode.Challenges.Year2015.Day1Test do
  use ExUnit.Case, async: true

  alias AdventOfCode.Challenges.Year2015.Day1

  import AdventOfCode.Challenges.LoadInput

  setup do
    {:ok, input: load_input_file(2015, 1)}
  end

  describe "solve_part1/1" do
    test "returns zero value", %{input: input} do
      assert Day1.solve_part1(input) == {:ok, 0}
    end
  end

  describe "solve_part2/1" do
    test "returns zero value", %{input: input} do
      assert Day1.solve_part2(input) == {:ok, 0}
    end
  end
end
