defmodule KitchenTracker.Repo.Migrations.CreateFoods do
  use Ecto.Migration

  def change do
    create table(:foods) do
      add :name, :string
      add :location, :string
      add :amount, :integer
      add :unit, :string
      add :expiration_date, :date
      add :type, :string

      timestamps(type: :utc_datetime)
    end
  end
end
