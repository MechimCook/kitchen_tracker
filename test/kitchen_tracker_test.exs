defmodule KitchenTrackerTest do
  use ExUnit.Case
  doctest KitchenTracker

  test "greets the world" do
    assert KitchenTracker.hello() == :world
  end
end
