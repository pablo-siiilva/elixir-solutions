defmodule Username do
  def sanitize([head | remaining]) do
    case head do
      head when head >= ?a and head <= ?z -> [head | sanitize(remaining)]
      ?_ -> [head | sanitize(remaining)]
      ?ä -> ~c"ae" ++ sanitize(remaining)
      ?ö -> ~c"oe" ++ sanitize(remaining)
      ?ü -> ~c"ue" ++ sanitize(remaining)
      ?ß -> ~c"ss" ++ sanitize(remaining)
      _ -> sanitize(remaining)
    end
  end

  def sanitize([]), do: ~c""
end