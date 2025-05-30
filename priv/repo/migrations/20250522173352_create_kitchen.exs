defmodule KitchenTracker.Repo.Migrations.CreateKitchen do
  use Ecto.Migration

  def change do
    create table(:food) do
      add :location, :string
      add :name, :string
      add :amount, :integer
      add :unit, :string
      add :expiration_date, :date
      add :type, :string

      timestamps()
    end
  end
end
