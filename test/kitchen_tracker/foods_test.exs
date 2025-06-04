defmodule KitchenTracker.FoodsTest do
  use KitchenTracker.DataCase

  alias KitchenTracker.Foods

  describe "foods" do
    alias KitchenTracker.Foods.Food

    import KitchenTracker.FoodsFixtures

    @invalid_attrs %{name: nil, type: nil, unit: nil, location: nil, amount: nil, expiration_date: nil}

    test "list_foods/0 returns all foods" do
      food = food_fixture()
      assert Foods.list_foods() == [food]
    end

    test "get_food!/1 returns the food with given id" do
      food = food_fixture()
      assert Foods.get_food!(food.id) == food
    end

    test "create_food/1 with valid data creates a food" do
      valid_attrs = %{name: "some name", type: "some type", unit: "some unit", location: "some location", amount: 42, expiration_date: ~D[2025-06-03]}

      assert {:ok, %Food{} = food} = Foods.create_food(valid_attrs)
      assert food.name == "some name"
      assert food.type == "some type"
      assert food.unit == "some unit"
      assert food.location == "some location"
      assert food.amount == 42
      assert food.expiration_date == ~D[2025-06-03]
    end

    test "create_food/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Foods.create_food(@invalid_attrs)
    end

    test "update_food/2 with valid data updates the food" do
      food = food_fixture()
      update_attrs = %{name: "some updated name", type: "some updated type", unit: "some updated unit", location: "some updated location", amount: 43, expiration_date: ~D[2025-06-04]}

      assert {:ok, %Food{} = food} = Foods.update_food(food, update_attrs)
      assert food.name == "some updated name"
      assert food.type == "some updated type"
      assert food.unit == "some updated unit"
      assert food.location == "some updated location"
      assert food.amount == 43
      assert food.expiration_date == ~D[2025-06-04]
    end

    test "update_food/2 with invalid data returns error changeset" do
      food = food_fixture()
      assert {:error, %Ecto.Changeset{}} = Foods.update_food(food, @invalid_attrs)
      assert food == Foods.get_food!(food.id)
    end

    test "delete_food/1 deletes the food" do
      food = food_fixture()
      assert {:ok, %Food{}} = Foods.delete_food(food)
      assert_raise Ecto.NoResultsError, fn -> Foods.get_food!(food.id) end
    end

    test "change_food/1 returns a food changeset" do
      food = food_fixture()
      assert %Ecto.Changeset{} = Foods.change_food(food)
    end
  end
end
