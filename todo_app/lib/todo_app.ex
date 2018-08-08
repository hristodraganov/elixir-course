defmodule TodoApp do
  @moduledoc """
  Documentation for TodoApp.
  """

  def new() do
    []
  end

  def add(list, id, text, date, completed) do
    [%{:id => id, :text => text, :date => date, :completed => completed} | list]
  end

  def search([], _) do
    {:error, "no such id"}
  end
  
  
  def search([%{:id => id_match, :text => text, :date => date, :completed => completed}| tail], id) do
    if id_match == id do
      %{:id => id_match, :text => text, :date => date, :completed => completed}
    else
      search(tail, id)
    end
    
  end

  
  
  def delete([%{:id => id_match, :text => text, :date => date, :completed => completed} | tail], id) do
    if id_match == id do
      List.delete_at([%{:id => id_match, :text => text, :date => date, :completed => completed} | tail], 0)
    else
      delete(tail, id, 1)
    end
  end

  def delete([%{:id => id_match, :text => text, :date => date, :completed => completed} | tail], id, pos) do
    if id_match == id  do
      List.delete_at([%{:id => id_match, :text => text, :date => date, :completed => completed} | tail], pos)
    else
      delete(tail, id, pos+1)
    end
  end
  
  def delete([], id, pos) do
    {:error, "id not found"}
  end
              

                    

  
end
