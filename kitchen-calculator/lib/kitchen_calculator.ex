defmodule KitchenCalculator do
  def get_volume({_, volume}) do
    volume
  end

  def to_milliliter({from_unit, volume}) do
    new_volume =
      case from_unit do
        :milliliter -> volume
        :cup -> 240 * volume
        :fluid_ounce -> 30 * volume
        :teaspoon -> 5 * volume
        :tablespoon -> 15 * volume
      end

    {:milliliter, new_volume}
  end

  def from_milliliter({:milliliter, volume}, to_unit) do
    new_volume =
      case to_unit do
        :milliliter -> volume
        :cup -> volume / 240
        :fluid_ounce -> volume / 30
        :teaspoon -> volume / 5
        :tablespoon -> volume / 15
      end

    {to_unit, new_volume}
  end

  def convert({from_unit, volume}, to_unit) do
    to_milliliter({from_unit, volume}) |> from_milliliter(to_unit)
  end
end
