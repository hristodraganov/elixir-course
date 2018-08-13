defmodule Seventh do

  def largest(list) do
    Enum.reduce(list, 0, &(
        if(&1 > &2) do
          &2 = &1
        else
          &2
        end))
  end

  def pow_num(result), do: result
  
  def pow_num(num, power, result) do
    if power > 1 do
      pow_num(num, power-1, result*num)
    else
      pow_num(result)
    end
  end
  
  def pow_num(num, power) do
    if power > 0 do
      pow_num(num, power-1, num*num)
    end
  end

  def digits(num) do
    count = Integer.digits(num)
    length(count)
  end

  def largest_denom(x, y) do
    cond do
      x == 0 -> 0
      y == 0 -> 0
      x == y -> x
      x > y -> largest_denom(x - y, y)
      y > x -> largest_denom(x, y - x)
      true -> "no denoms"
    end
  end

  def sum(), do: sum(1, 0)

  def sum(num, sum) do
    if(num < 1000) do
      num(num + 1, if ((rem(num, 3) == 0) || (rem(num, 5) == 0)) do
            sum + num
          else
            sum
          end)
    else
      sum
    end
  end

  def fib_seq() do
    fib_seq(1, 2, 0)
  end

  def fib_seq(x, y, sum) do
    if(sum < 4000000) do
      fib_seq(y, y+x, if(rem(y, 2) == 0) do
            sum + y
          else
            sum
          end)
    else  
      sum
    end  
  end
  
end
