import Config

config :advent_of_code, AdventOfCode.Challenges, input_files_path: "priv/input_files"

config :logger,
  level: :info,
  backends: [:console]

import_config "#{config_env()}.exs"
