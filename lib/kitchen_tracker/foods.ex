defmodule KitchenTracker.Foods do
  alias KitchenTracker.{Repo, Food}

  def list_food do
    Repo.all(Food)
  end

  def get_food!(id), do: Repo.get!(Food, id)

  def create_food(attrs \\ %{}) do
    %Food{}
    |> Food.changeset(attrs)
    |> Repo.insert()
  end

  def update_food(%Food{} = food, attrs) do
    food
    |> Food.changeset(attrs)
    |> Repo.update()
  end

  def delete_food(%Food{} = food) do
    Repo.delete(food)
  end
end
