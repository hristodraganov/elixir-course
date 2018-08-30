defmodule Example do

  def print_hello() do
    spawn fn ->
      IO.puts("Hello new lesson")
      end
  end

  def send_double() do
    spawn fn ->
      receive do
        {source, number} -> send(source, number*2)
      end
    end
  end

  def execute_func() do
    spawn fn ->
      receive do
        {source, function} -> send(source, function.())
      end
    end
  end
  
  def double_numbers(list_nums, pid) do
    list_nums
    |> Enum.map(fn num ->
      spawn(fn -> send(pid, num*2) end)
    end)
    |> Enum.map(fn _ ->
      receive do
        num -> num
      end
    end)
  end

  def ping() do
    spawn(fn -> do_ping() end)
  end
  
  def do_ping() do
    receive do
      :exit -> IO.puts("exit ping")
      {:ping, send_to} ->
        :timer.sleep(1000)
        IO.puts("Ping")
        send(send_to, {:pong, self()}) 
        do_ping()
    end
  end

  def pong() do
    spawn(fn -> do_pong() end)
  end
  
  def do_pong() do
    receive do
      :exit -> IO.puts("exit pong")
      {:pong, send_to} ->
        :timer.sleep(1000)
        IO.puts("Pong")
        send(send_to, {:ping, self()})
        do_pong()
    end
  end
  
end
