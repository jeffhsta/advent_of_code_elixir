defmodule AdventOfCode.AppArgs do
  @moduledoc """
  Struct for application arguments
  """

  @type t :: %__MODULE__{
          years: [integer()],
          days: [integer()]
        }

  defstruct [:years, :days]
end
