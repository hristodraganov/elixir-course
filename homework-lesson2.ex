defmodule Homework do

  def first_task() do
    # Using a pattern match, assign "Alice" to a variable "first_name", and "Addison" to variable "last_name"
    {"first_name", "last_name"} = {"Alice", "Addison"}

    # Assign the number to the variable "age", and the letter to "sex"
    {age, "sex"} = {32, "f"}

    # Create a patter, that will fail if the first item of the tuple is anything other than "200"
    {200, _, _} = {200, "example data", :an_atom}

    # From here on, do not use variables. All of these are heavily inspired by elixirkoans
    true = true
    false = !true
    2 = 1 + 1
    4.0 = 2 / 0.5
    6 = 2 * 3
    3 > 2
    "hello world" = "hello"  <> "world"
    [1, 2, :a, "b"] = [1, 2] ++ [:a, "b"]
    [1, 2] = [1, 2, 3] -- [3]
  end
end
