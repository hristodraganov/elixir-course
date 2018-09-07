defmodule StateCalc do
  
  use GenServer
  
  def init(number), do: {:ok, number}
  
  def handle_cast({:add, number}, current_number) do
    {:noreply, number + current_number}
  end

  def handle_cast({:take, number}, current_number) do
    {:noreply, current_number - number}
  end

  def handle_cast({:multiply, number}, current_number) do
    {:noreply, current_number * number}
  end

  def handle_cast({:divide, number}, current_number) do
    {:noreply, current_number / number}
  end

  def handle_cast({:transform, function}, current_number) do
    {:noreply, function.(current_number)}
  end

  def handle_cast({:print, function}, current_number) do
    temp = function.(current_number)
    IO.puts(temp)
    {:noreply, current_number}
  end
  
  def handle_call(:status, _from, current_number) do
    {:reply, current_number, current_number}
  end
  
end
