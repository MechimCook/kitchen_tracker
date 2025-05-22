defmodule KitchenTracker.Repo do
  use Ecto.Repo,
    otp_app: :kitchen_tracker,
    adapter: Ecto.Adapters.Postgres
end
