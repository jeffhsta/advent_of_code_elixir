defmodule AdventOfCode.ChallengesTest do
  use ExUnit.Case, async: true

  alias AdventOfCode.Challenges
  alias AdventOfCode.AppArgs

  describe "process/1" do
    test "returns :ok when processing all challenges" do
      args = %AppArgs{years: [1], days: [1]}

      log_output =
        ExUnit.CaptureLog.capture_log(fn ->
          assert Challenges.process(args) == :ok
        end)

      assert log_output =~ "## Year 1 ##"
      assert log_output =~ "--- Day 1 ---"
      assert log_output =~ "Part 1: 0"
      assert log_output =~ "Part 2: 0"
      assert log_output =~ "----------------------------"
      assert log_output =~ "##########################"
    end

    test "returns :ok and log error when file is not found" do
      args = %AppArgs{years: [1], days: [2]}

      log_output =
        ExUnit.CaptureLog.capture_log(fn ->
          assert Challenges.process(args) == :ok
        end)

      assert log_output =~ "## Year 1 ##"
      assert log_output =~ "--- Day 2 ---"
      assert log_output =~ "input_file_not_accessible"
      assert log_output =~ "----------------------------"
      assert log_output =~ "##########################"
    end
  end
end
