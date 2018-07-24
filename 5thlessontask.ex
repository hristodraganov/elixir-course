defmodule Fifth_Homework do

  def list_lenght([]) do
    
    0
    
  end

  def list_lenght([h | t]) do
    
    list_lenght(t, 1)
    
  end

  def list_lenght([], lenght) do
    
    lenght
    
  end

  def list_lenght([h | t],lenght) do
    
    list_lenght(t, lenght + 1)
    
  end



  
  def sum_elems([]) do
    
    {:error,"reason"}
    
  end

  def sum_elems([h | t]) do
    
    sum_elems(t, h)
    
  end

  def sum_elems([], sum) do
    
    sum
    
  end

  def sum_elems([h | t], sum) do
    
    sum_elems(t, sum + h)
    
  end



  
  def sum_evens_in_list([]), do: {:error, "reason"}
    

  def sum_evens_in_list([h | t]) do
    
    sum =
    
    if ( rem(h, 2) == 0)
    
      do
      
      sum = h
      
      else
        
        sum = 0
        
    end
    
    sum_evens_in_list(t, sum)
    
  end
  
  def sum_evens_in_list([], sum, do: sum

  def sum_evens_in_list([h | t], sum) do
    
    if (rem(h, 2) == 0) do
      
      sum = sum + h
      
    end
    
    sum_evens_in_list(t, sum)
    
  end


                        
  def upcase_a([]): do, {:error,"reason"}
  
  def upcase_a([h | t]) do
    
    if ( String.at(h, 0) == "a" || String.at(h,0) == "A" ) do
      
      upcase_head = String.upcase(h)
      
    end
    
    toUpper(t,[upcase_head])
    
  end

  def upcase_a([], upcase_list), do: upcase_list
  
  def upcase_a([h | t], upcase_list) do
    
    if ( String.at(h, 0) == "a" || String.at(h,0) == "A" ) do
      
      upcase_head = String.upcase(h)
      
    end
    
    upcase_a(t, upcase_list ++ [upcase_head])
    
  end
 end
                        
