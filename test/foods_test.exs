defmodule FoodsTest do
  use ExUnit.Case, async: true
  alias KitchenTracker.{Repo, Food}

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
    :ok
  end

  test "add/2 adds food to a valid location" do
    assert :ok = KitchenTracker.add(:fridge, "Milk")
    assert [%Food{name: "Milk", location: :fridge}] = Repo.all(Food)
  end

  test "add/2 returns error for invalid location" do
    assert {:error, _} = KitchenTracker.add(:garage, "Eggs")
    assert [] = Repo.all(Food)
  end

  test "check/1 returns food counts for a valid location" do
    KitchenTracker.add(:pantry, "Beans")
    KitchenTracker.add(:pantry, "Beans")
    KitchenTracker.add(:pantry, "Rice")
    result = KitchenTracker.check(:pantry)
    assert result["Beans"] == 2
    assert result["Rice"] == 1
  end

  test "check/1 returns error for invalid location" do
    assert {:error, _} = KitchenTracker.check(:garage)
  end
end
