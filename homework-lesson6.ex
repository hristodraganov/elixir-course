def double_elements(list) do

    Enum.reduce(list, [], fn x, acc -> [x*2 | acc] end)
    
  end

  def double_evens(list) do

    Enum.reduce(list, [], fn x,acc ->
      if ( rem(x,2) == 0) do
        [x*2 | acc]
      else
        acc
      end
    end)
    
  end
 

defmodule Refrigerator do

  def new() do
    %{}
  end

  def add(map, key, key_value) do
    
    if Map.has_key?(map, key) do
      
      Map.update!(map, key, &(&1 + key_value))
      
    else

      Map.put(map, key, key_value)
      
    end

  end

  def remove(map, key, key_value) do
    
    Map.update!(map, key, &(if((&1 - key_value) > 0)
            do &1 - key_value
            else
              0
          end))
    
  end
  
end
