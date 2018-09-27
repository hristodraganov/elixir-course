defmodule Movies do

  use GenServer

  #initializing part
  
  def start(), do: GenServer.start_link(__MODULE__, [%{}], name: __MODULE__)

  def init(list_of_movies), do: {:ok, list_of_movies}

  #call functions

  def status() do
    GenServer.call(__MODULE__, {:status})
  end
  
  def add_movie(movie_name, genre, actors, year, rating) do
    GenServer.call(__MODULE__, {:add, movie_name, genre, actors, year, rating})
  end

  def search_by_id(id) do
    GenServer.call(__MODULE__, {:by_id, id})
  end

  def newer_than_yr(year) do
    GenServer.call(__MODULE__, {:newer_than, year})
  end

  def older_than_yr(year) do
    GenServer.call(__MODULE__, {:older_than, year})
  end

  def find_by_genre(genre) do
    GenServer.call(__MODULE__, {:genre, genre})
  end

  def delete_by_id(id) do
    GenServer.call(__MODULE__, {:remove, id})
  end

  def search_by_name(part_of_name) do
    GenServer.call(__MODULE__, {:by_name, part_of_name})
  end

  def search_actor(actor) do
    GenServer.call(__MODULE__, {:actor, actor})
  end

  #private functios
  
  defp find_actor(list_of_movies, actor) do
    Enum.filter(list_of_movies, fn %{:actors => actors_list} ->
      Enum.any?(actors_list, fn actor_x -> actor_x == actor end) end)
  end
  
  defp search_name([], _), do: {:error, "No movie contains the string in its name."}
  
  defp search_name([%{:movie_name => movie_name} = state | tail], part_of_name) do
    if true == String.contains?(movie_name, part_of_name) do
      state
    else
      search_name(tail, part_of_name)
    end
  end
  
  defp delete_id(list_of_movies, id) do
    List.delete(list_of_movies, List.first(Enum.filter(list_of_movies,
              fn %{:id => id_x} -> id_x == id end)))
  end
        
  defp genre(list_of_movies, genre) do
    Enum.filter(list_of_movies, fn %{:genre => genre_x} ->
      genre == genre_x end)
  end
  
  defp older(list_of_movies, year) do
    if Enum.filter(list_of_movies, fn %{:year => year_x} ->
          year_x < year end) == [] do
      {:error, "No movies older than the selected year."}
    else
      Enum.filter(list_of_movies, fn %{:year => year_x} ->
        year_x < year end)
    end
  end

  defp newer(list_of_movies, year) do
    if Enum.filter(list_of_movies, fn %{:year => year_x} ->
          year_x > year end) == [] do
       {:error, "No movies newer than the selected year."}
    else
      Enum.filter(list_of_movies, fn %{:year => year_x} ->
        year_x > year end)
    end
  end
  
  defp add_do(list_of_movies, movie_name, genre, actors, year, rating) do
    if Map.get(List.first(list_of_movies), :id) == nil do
      [%{:id => 1, :movie_name => movie_name, :genre => genre,
       :actors => actors, :year => year, :rating => rating}]
    else
        [%{:id => 1 + Map.get(List.first(list_of_movies), :id), :movie_name => movie_name, :genre => genre,
           :actors => actors, :year => year, :rating => rating} | list_of_movies]
    end
  end

  defp search_by_id([], _), do: {:error, "No such id found."}
  
  defp search_by_id([%{:id => id} = state | tail], id_x) do
    if id == id_x do
      state
    else
      search_by_id(tail, id_x)
    end
  end

  #server part
  
  def handle_call({:add, movie_name, genre, actors, year, rating}, _from, list_of_movies) do
    {:reply,
     add_do(list_of_movies, movie_name, genre, actors, year, rating),
     add_do(list_of_movies, movie_name, genre, actors, year, rating)}  
  end

  def handle_call({:by_id, id}, _from, list_of_movies) do
    {:reply,
     search_by_id(list_of_movies, id),
     list_of_movies}
  end

  def handle_call({:newer_than, year}, _from, list_of_movies) do
    {:reply, newer(list_of_movies, year), list_of_movies}
  end

  def handle_call({:older_than, year}, _from, list_of_movies) do
    {:reply,
     older(list_of_movies, year),
     list_of_movies}
  end

  def handle_call({:genre, genre}, _from, list_of_movies) do
    {:reply,
     genre(list_of_movies, genre),
     list_of_movies}
  end
  
  def handle_call({:remove, id}, _from, list_of_movies) do
    new_state = delete_id(list_of_movies, id)
    {:reply, IO.puts("Movie deleted."), new_state}
  end
  
  def handle_call({:by_name, part_of_name}, _from, list_of_movies) do
    {:reply,
     search_name(list_of_movies, part_of_name),
     list_of_movies}
  end
  
  def handle_call({:actor, actor}, _from, list_of_movies) do
    {:reply,
     find_actor(list_of_movies, actor),
     list_of_movies}
  end

  def handle_call({:status}, _from, list_of_movies) do
    {:reply, list_of_movies, list_of_movies}
  end
  
end
