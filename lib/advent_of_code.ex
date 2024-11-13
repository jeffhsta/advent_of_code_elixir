defmodule AdventOfCode do
  @moduledoc """
  AdventOfCode root module
  """

  alias AdventOfCode.Challenges
  alias AdventOfCode.CLI

  require Logger

  def main(args \\ System.argv()) do
    with {:ok, parsed_args} <- CLI.parse_args(args) do
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
  end
end
