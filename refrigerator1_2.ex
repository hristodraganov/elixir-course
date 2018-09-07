defmodule StateRefrigerator do

  use GenServer

  def start(), do: GenServer.start(__MODULE__, %{}, name: __MODULE__)

  def init(map_state), do: {:ok, map_state}

  def add(product, quantity), do: GenServer.cast(__MODULE__, {:add, product, quantity})

  def take(product, quantity), do: GenServer.cast(__MODULE__, {:take, product, quantity})

  def status(), do: GenServer.call(__MODULE__, :status)

  defp add_do(map_state, product, quantity) do
    if Map.has_key?(map_state, product) do
      Map.update!(map_state, product, &(&1 + quantity))
    else
      Map.put(map_state, product, quantity)
    end
  end

  defp take_do(map_state, product, quantity) do
    if quantity >= Map.get(map_state, product) do
      Map.delete(map_state, product)
    else
      Map.update!(map_state, product, &(&1 - quantity))
    end
  end
  
  def handle_cast({:add, product, quantity}, map_state) do
    {:noreply, add_do(map_state, product, quantity)}
  end
  
  def handle_cast({:take, product, quantity}, map_state) do
    {:noreply, take_do(map_state, product, quantity)}
  end

  def handle_call(:status, _from, map_state) do
    {:reply, map_state, map_state}
  end
  
end
