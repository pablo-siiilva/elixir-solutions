defmodule CollatzConjecture do
  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input, step \\ 0)
  def calc(input, step) when input == 1, do: step
  def calc(input, step) when input > 1, do: calc(calculate_step(input), step + 1)

  defp calculate_step(input) do
    if (is_even?(input)) do
      div(input, 2)
    else
      (input * 3) + 1
    end
  end
  
  defp is_even?(num) when is_integer(num), do: rem(num, 2) == 0
end
