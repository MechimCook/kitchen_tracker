import Config

config :kitchen_tracker,
  ecto_repos: [KitchenTracker.Repo]

config :kitchen_tracker, KitchenTracker.Repo,
  database: "kitchen_tracker_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"
