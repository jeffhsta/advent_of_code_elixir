defmodule AdventOfCode.CLI do
  @moduledoc """
  Deals with CLI arguments
  """

  alias AdventOfCode.AppArgs

  @years_range 2015..2024
  @days_range 1..25

  @spec parse_args([String.t()]) ::
          {:ok, AppArgs.t()}
          | {:error,
             :need_to_specify_year
             | :invalid_number_of_arguments
             | :year_argument_out_of_range
             | :day_argument_out_of_range
             | :invalid_year_argument
             | :invalid_day_argument}
  def parse_args([year, day]) do
    with {:ok, year} <- parse_year(year),
         {:ok, day} <- parse_day(day) do
      {:ok, %AppArgs{years: [year], days: [day]}}
    end
  end

  def parse_args([year]) do
    with {:ok, year} <- parse_year(year) do
      {:ok, %AppArgs{years: [year], days: Enum.to_list(@days_range)}}
    end
  end

  def parse_args([]) do
    {:error, :need_to_specify_year}
  end

  def parse_args(_args) do
    {:error, :invalid_number_of_arguments}
  end

  defp parse_year(year_str) do
    case Integer.parse(year_str) do
      {year, ""} when year in @years_range -> {:ok, year}
      {_year, ""} -> {:error, :year_argument_out_of_range}
      _error -> {:error, :invalid_year_argument}
    end
  end

  defp parse_day(day_str) do
    case Integer.parse(day_str) do
      {day, ""} when day in @days_range -> {:ok, day}
      {_day, ""} -> {:error, :day_argument_out_of_range}
      _error -> {:error, :invalid_day_argument}
    end
  end
end
