defmodule KitchenTracker.FoodsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `KitchenTracker.Foods` context.
  """

  @doc """
  Generate a food.
  """
  def food_fixture(attrs \\ %{}) do
    {:ok, food} =
      attrs
      |> Enum.into(%{
        amount: 42,
        expiration_date: ~D[2025-06-03],
        location: "some location",
        name: "some name",
        type: "some type",
        unit: "some unit"
      })
      |> KitchenTracker.Foods.create_food()

    food
  end
end
