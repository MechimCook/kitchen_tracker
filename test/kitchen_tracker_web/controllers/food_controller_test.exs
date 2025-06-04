defmodule KitchenTrackerWeb.FoodControllerTest do
  use KitchenTrackerWeb.ConnCase

  import KitchenTracker.FoodsFixtures

  @create_attrs %{name: "some name", type: "some type", unit: "some unit", location: "some location", amount: 42, expiration_date: ~D[2025-06-03]}
  @update_attrs %{name: "some updated name", type: "some updated type", unit: "some updated unit", location: "some updated location", amount: 43, expiration_date: ~D[2025-06-04]}
  @invalid_attrs %{name: nil, type: nil, unit: nil, location: nil, amount: nil, expiration_date: nil}

  describe "index" do
    test "lists all foods", %{conn: conn} do
      conn = get(conn, ~p"/foods")
      assert html_response(conn, 200) =~ "Listing Foods"
    end
  end

  describe "new food" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/foods/new")
      assert html_response(conn, 200) =~ "New Food"
    end
  end

  describe "create food" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/foods", food: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/foods/#{id}"

      conn = get(conn, ~p"/foods/#{id}")
      assert html_response(conn, 200) =~ "Food #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/foods", food: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Food"
    end
  end

  describe "edit food" do
    setup [:create_food]

    test "renders form for editing chosen food", %{conn: conn, food: food} do
      conn = get(conn, ~p"/foods/#{food}/edit")
      assert html_response(conn, 200) =~ "Edit Food"
    end
  end

  describe "update food" do
    setup [:create_food]

    test "redirects when data is valid", %{conn: conn, food: food} do
      conn = put(conn, ~p"/foods/#{food}", food: @update_attrs)
      assert redirected_to(conn) == ~p"/foods/#{food}"

      conn = get(conn, ~p"/foods/#{food}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, food: food} do
      conn = put(conn, ~p"/foods/#{food}", food: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Food"
    end
  end

  describe "delete food" do
    setup [:create_food]

    test "deletes chosen food", %{conn: conn, food: food} do
      conn = delete(conn, ~p"/foods/#{food}")
      assert redirected_to(conn) == ~p"/foods"

      assert_error_sent 404, fn ->
        get(conn, ~p"/foods/#{food}")
      end
    end
  end

  defp create_food(_) do
    food = food_fixture()
    %{food: food}
  end
end
