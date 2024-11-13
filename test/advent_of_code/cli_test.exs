defmodule AdventOfCode.CLITest do
  use ExUnit.Case, async: true

  alias AdventOfCode.CLI
  alias AdventOfCode.AppArgs

  describe "parse_args/1" do
    test "returns parsed args when passing year and day " do
      assert CLI.parse_args(["2015", "1"]) == {:ok, %AppArgs{years: [2015], days: [1]}}
    end

    test "returns parsed args with year and all days when passing only year as argument" do
      assert CLI.parse_args(["2015"]) == {:ok, %AppArgs{years: [2015], days: Enum.to_list(1..25)}}
    end

    test "returns parsed args with all years and all days when passing no arguments" do
      assert CLI.parse_args([]) ==
               {:ok, %AppArgs{years: Enum.to_list(2015..2024), days: Enum.to_list(1..25)}}
    end

    test "returns an error when passing wrong number or arguments" do
      assert CLI.parse_args(["1", "2", "3", "4"]) == {:error, :invalid_number_of_arguments}
    end

    test "returns an error when passing an out of range year as argument" do
      assert CLI.parse_args(["1990"]) == {:error, :year_argument_out_of_range}
    end

    test "returns an error when passing invalid year as argument" do
      assert CLI.parse_args(["abc"]) == {:error, :invalid_year_argument}
    end

    test "returns an error when passing an out of range day as argument" do
      assert CLI.parse_args(["2015", "31"]) == {:error, :day_argument_out_of_range}
    end

    test "returns an error when passing invalid day as argument" do
      assert CLI.parse_args(["2015", "abc"]) == {:error, :invalid_day_argument}
    end
  end
end
