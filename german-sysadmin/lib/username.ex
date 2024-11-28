defmodule Username do
  def sanitize([]), do: []

  def sanitize([h | t]) do
    sanitized =
      case h do
        c when (c >= ?a and c <= ?z) or c == ?_ -> [c]
        ?ä -> ~c"ae"
        ?ö -> ~c"oe"
        ?ü -> ~c"ue"
        ?ß -> ~c"ss"
        _ -> []
      end

    sanitized ++ sanitize(t)
  end
end
