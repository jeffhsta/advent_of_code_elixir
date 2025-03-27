defmodule AdventOfCode do
  @moduledoc """
  AdventOfCode root module
  """

  alias AdventOfCode.Challenges
  alias AdventOfCode.CLI

  require Logger

  @error_messages [
    need_to_specify_year: "Need to specify year",
    invalid_number_of_arguments:
      "Invalid number of arguments, need to specify at least one year and maybe a day",
    year_argument_out_of_range: "Year argument out of range, must be between 2015 and 2024",
    day_argument_out_of_range: "Day argument out of range, must be between 1 and 25",
    invalid_year_argument: "Invalid year argument",
    invalid_day_argument: "Invalid day argument"
  ]

  @spec main([String.t()]) :: :ok | no_return()
  def main(args \\ System.argv()) do
    case CLI.parse_args(args) do
      {:ok, parsed_args} -> process_with_args(parsed_args)
      {:error, error} -> handle_error(error)
    end
  end

  defp process_with_args(parsed_args) do
    Logger.info("Starting Advent of Code...")

    cond do
      length(parsed_args.years) > 1 ->
        Logger.info("Processing all years")

      length(parsed_args.days) > 1 ->
        Logger.info("Processing year #{List.first(parsed_args.years)} all days")

      true ->
        Logger.info(
          "Processing year #{List.first(parsed_args.years)} day #{List.first(parsed_args.days)}"
        )
    end

    Challenges.process(parsed_args)
  end

  @spec handle_error(atom()) :: no_return()
  defp handle_error(error) do
    Logger.error(@error_messages[error] || "Unknown error")
    Logger.flush()
    System.halt(1)
  end
end
