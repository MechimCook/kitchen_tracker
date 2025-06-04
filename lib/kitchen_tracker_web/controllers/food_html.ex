defmodule KitchenTrackerWeb.FoodHTML do
  use KitchenTrackerWeb, :html

  embed_templates "food_html/*"

  @doc """
  Renders a food form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def food_form(assigns)
end
