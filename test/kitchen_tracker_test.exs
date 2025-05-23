defmodule KitchenTrackerTest do
  use KitchenTracker.RepoCase
  doctest KitchenTracker

  test "Add food stuff" do

    assert KitchenTracker.add(:freezer, "steak") == :ok
    assert KitchenTracker.check(:freezer) == %{"steak" => 1}
    assert KitchenTracker.add(:freezer, "steak") == :ok
    assert KitchenTracker.check(:freezer) == %{"steak" => 2}
    assert KitchenTracker.add(:freezer, "chicken") == :ok
    assert KitchenTracker.check(:freezer) == %{"steak" => 2, "chicken" => 1}
    assert KitchenTracker.add(:freezer, "chicken") == :ok
    assert KitchenTracker.check(:freezer) == %{"steak" => 2, "chicken" => 2}
  end
end
