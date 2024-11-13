defmodule AdventOfCode.Challenges do
  @moduledoc """
  Deals with challenges, call functions based on application arguments and load input files
  """

  alias AdventOfCode.AppArgs

  require Logger

  @input_files_path :advent_of_code
                    |> Application.compile_env(__MODULE__)
                    |> Keyword.fetch!(:input_files_path)

  @spec process(AppArgs.t()) :: :ok
  def process(args) do
    Enum.each(args.years, fn year ->
      Logger.info("## Year #{year} ##")

      Enum.each(args.days, fn day ->
        Logger.info("--- Day #{day} ---")

        year
        |> solve_challenge(day)
        |> print_result()

        Logger.info("----------------------------")
      end)

      Logger.info("##########################")
    end)
  end

  defp solve_challenge(year, day) do
    challenge_module = String.to_existing_atom("#{__MODULE__}.Year#{year}.Day#{day}")

    with {:ok, input} <- load_input_file_content(year, day),
         {:ok, result_part1} <- challenge_module.solve_part1(input),
         {:ok, result_part2} <- challenge_module.solve_part2(input) do
      {:ok, result_part1, result_part2}
    end
  end

  defp load_input_file_content(year, day) do
    @input_files_path
    |> Path.join("year_#{year}/day_#{day}.txt")
    |> File.read()
    |> case do
      {:ok, content} -> {:ok, content}
      {:error, _reason} -> {:error, :input_file_not_accessible}
    end
  end

  defp print_result({:ok, result_part1, result_part2}) do
    Logger.info("Part 1: #{result_part1}")
    Logger.info("Part 2: #{result_part2}")
  end

  defp print_result({:error, reason}) do
    Logger.error("Error: #{reason}")
  end
end
