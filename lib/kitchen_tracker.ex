defmodule KitchenTracker do
  @moduledoc """
  Documentation for `KitchenTracker`.
  """
   import Ecto.Query, only: [from: 2]

  alias KitchenTracker.Repo
  alias KitchenTracker.Food

  @locations [:freezer, :fridge,  :pantry]

  def add(location, food_name) do
    # Check if the location exists
    if location in @locations do

      Repo.insert(%Food{location: location, name: food_name})

      # Update the locations
      :ok
    else
      {:error, "Location not found"}
    end
  end
  def check(location) do
    # Check if the location exists
    if location in @locations do

      Repo.all(from f in Food, where: f.location == ^location)
      |> Enum.group_by(& &1.name, & &1.id)
      |> Enum.map(fn {name, ids} -> {name, length(ids)} end)
      |> Enum.into(%{})
    else
      {:error, "Location not found"}
    end
  end
end
