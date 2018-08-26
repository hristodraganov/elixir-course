defmodule DogTest do
  use ExUnit.Case
  doctest Dog

  test "greets the world" do
    assert Dog.hello() == :world
  end
end
