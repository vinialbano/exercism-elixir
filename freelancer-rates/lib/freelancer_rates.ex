defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  def apply_discount(before_discount, discount) do
    before_discount * (1 - discount / 100)
  end

  defp discounted_daily_rate(hourly_rate, discount) do
    daily_rate(hourly_rate) |> apply_discount(discount)
  end

  def monthly_rate(hourly_rate, discount) do
    (22 * discounted_daily_rate(hourly_rate, discount)) |> ceil()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    (budget / discounted_daily_rate(hourly_rate, discount)) |> Float.floor(1)
  end
end
