defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    r2 = x * x + y * y

    cond do
      r2 <= 1 -> 10
      r2 <= 25 -> 5
      r2 <= 100 -> 1
      true -> 0
    end
  end
end
