defmodule AdventOfCode do
  @moduledoc """
  AdventOfCode root module
  """

  @application :advent_of_code
  @input_files_path "priv/input_files"
  @day1_input_file "day1.txt"

  @doc ~S"""
  This function uses the input to solve day 1 challenge

  ## Examples

    iex> AdventOfCode.day1()
    {:ok, 188, 68775}
  """
  @spec day1 :: {:ok, integer(), integer()}
  def day1 do
    @day1_input_file
    |> load_input_file_content()
    |> __MODULE__.Day1.solve()
  end

  defp load_input_file_content(filename) do
    filename
    |> then(& Path.join(@input_files_path, &1))
    |> then(& Application.app_dir(@application, &1))
    |> File.read!()
  end
end
