defmodule KitchenTracker do
  @moduledoc """
  Documentation for `KitchenTracker`.
  """

  alias KitchenTracker.Foods

  @locations [:freezer, :fridge, :pantry]

  def add(location, food_name) do
    if location in @locations do
      Foods.create_food(%{location: location, name: food_name})
      :ok
    else
      {:error, "Location not found"}
    end
  end

  def check(location) do
    if location in @locations do
      Foods.list_food()
      |> Enum.filter(&(&1.location == location))
      |> Enum.group_by(& &1.name, & &1.id)
      |> Enum.map(fn {name, ids} -> {name, length(ids)} end)
      |> Enum.into(%{})
    else
      {:error, "Location not found"}
    end
  end
end
