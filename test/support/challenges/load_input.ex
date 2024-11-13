defmodule AdventOfCode.Challenges.LoadInput do
  @spec load_input_file(integer(), integer()) :: String.t()
  def load_input_file(year, day) do
    File.read!("priv/input_files/year_#{year}/day_#{day}.txt")
  end
end
