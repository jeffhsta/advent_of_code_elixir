defmodule AdventOfCode.Day1Test do
  use ExUnit.Case, async: true
  alias AdventOfCode.Day1

  describe "Day1.solve/1" do
    test "returns the Elf 0 and calories 1000" do
      input = """
      1000
      """

      assert Day1.solve(input) == {:ok, 0, 1000}
    end

    test "returns the Elf 0 and calories 1700" do
      input = """
      1000
      700
      """

      assert Day1.solve(input) == {:ok, 0, 1700}
    end

    test "returns the Elf 1 and calories 2100" do
      input = """
      1000
      700

      1100
      1000
      """

      assert Day1.solve(input) == {:ok, 1, 2100}
    end

    test "returns the Elf 2 and calories 3500" do
      input = """
      1000
      700

      1100
      1000

      3500
      """

      assert Day1.solve(input) == {:ok, 2, 3500}
    end

    test "returns the Elf 1 and calories 4000" do
      input = """
      1000
      700

      1100
      1000
      1900

      3500
      """

      assert Day1.solve(input) == {:ok, 1, 4000}
    end
  end
end
