defmodule Ninth do

  def all_true([], _), do: true
  
  def all_true([h | t], func) do
    if (func.(h) == true) do
      all_true(t, func)
    else
      false
    end
    
  end

  def any_true([], _), do: false
  
  def any_true([h | t], func) do
    if(func.(h) == true) do
      true
    else
      any_true(t, func)
    end
  end
  
  def get_element_at([h | t], _,  pos, pos_x) do
    if pos_x == pos do
      h
    else
      get_element_at(t, 0,  pos, pos_x + 1)
    end
  end
  
  def get_element_at([h | t], pos, value) do
    if pos > length([h | t]) - 1 do
      value
    else
      get_element_at([h | t], 0,  pos, 0)
    end
  end

  
  def max_by(last, [], _, _), do: last

  def max_by(first, [h | t], func, list) do
    if func.(first) > func.(h) do
      max_by(first, t, func, list)
    else
      max_by(h, t, func, list)
    end
  end
  
  def max_by([h | t], func) do
    max_by(h, t, func, [h | t])
  end

  def take_first_n([h | t], first_n, pos, last_taken) when Kernel.is_list(last_taken) do
    if pos + 1 == first_n do
      last_taken ++ [h]
    else
      take_first_n(t, first_n, pos + 1, last_taken ++ [h])
    end
  end
  
  def take_first_n([h | t], first_n, pos, last_taken)  do
    if pos + 1 == first_n do
      [last_taken] ++ [h]
    else
      take_first_n(t, first_n, pos + 1, [last_taken] ++ [h])
    end
  end
  
  def take_first_n([h | t], first_n, pos) do
    if pos + 1 == first_n do
      [h]
    else
      take_first_n(t, first_n, pos + 1, h)
    end
  end
  
  def take_first_n(list, first_n) do
    if first_n > length(list) do
      list
    else
      take_first_n(list, first_n, 0)
    end
  end
  
end

