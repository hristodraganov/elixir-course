defmodule Dog do
  @moduledoc """
  Documentation for Dog.
  """
  def get_dog_picture do()
    url = "https://dog.ceo/api/breeds/image/random"
    HTTPoison.get!(url)
  end
end
