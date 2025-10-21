defmodule ResistorColorDuo do
  @encoded_colors %{
                      black: 0,
                      brown: 1,
                      red: 2,
                      orange: 3,
                      yellow: 4,
                      green: 5,
                      blue: 6,
                      violet: 7,
                      grey: 8,
                      white: 9
                  }
  @spec code(atom) :: integer()
  defp code(color), do: Map.get(@encoded_colors, color)
  
  @doc """
  Calculate a resistance value from two colors
  """
  @spec value(colors :: [atom]) :: integer()
  def value([first, second | _tail]) do
    code(first) * 10 + code(second)
  end

  def value([single_color]), do: single_color
  def value([]), do: 0
end
