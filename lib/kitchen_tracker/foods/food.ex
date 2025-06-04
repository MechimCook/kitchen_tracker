defmodule KitchenTracker.Foods.Food do
  use Ecto.Schema
  import Ecto.Changeset

  schema "foods" do
    field :name, :string
    field :type, :string
    field :unit, :string
    field :location, :string
    field :amount, :integer
    field :expiration_date, :date

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(food, attrs) do
    food
    |> cast(attrs, [:name, :location, :amount, :unit, :expiration_date, :type])
    |> validate_required([:name, :location, :amount, :unit, :expiration_date, :type])
  end
end
