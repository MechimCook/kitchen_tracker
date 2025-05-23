defmodule KitchenTracker.Food do
  use Ecto.Schema
  import Ecto.Changeset

  schema "food" do
    field :name, :string
    field :location, Ecto.Enum, values: [:freezer, :fridge, :pantry]
  end

  def changeset(food, attrs) do
    food
    |> cast(attrs, [:name, :location])
    |> validate_required([:name, :location])
  end
end
