defmodule Tenth do

  def loop do
    spawn fn ->
      receive do
      {:test, text} -> IO.puts("received " <> text)
      {:foo} -> IO.puts("Done the first task")
      {source, text} -> send(source, {:answer, text})
      _ -> IO.puts("Done the second task")
    end
      loop()
    end
  end


end
