defmodule Refrigerator_processes do
  
  def start(), do: spawn(fn -> receive_actions(%{}) end)
  
  def receive_actions(state) do
    receive do
      {:add, product, quantity} ->
        state = if Map.has_key?(state, product) do
          Map.update!(state, product, &(&1 + quantity))
        else
          Map.put(state, product, quantity)
        end
        receive_actions(state)    
      
      {:take, product, quantity} ->
        state = if quantity >= Map.get(state, product) do
            Map.delete(state, product)
          else
            Map.update!(state, product, &(&1 - quantity))
          end
        receive_actions(state)
      
      {:status} ->
        IO.inspect(state)
        receive_actions(state)
      
    end
  end
  
  def add(pid, product, quantity), do: send(pid, {:add, product, quantity})
  
  def take(pid, product, quantity), do: send(pid, {:take, product, quantity})
  
  def status(pid), do: send(pid, {:status})
  
end

