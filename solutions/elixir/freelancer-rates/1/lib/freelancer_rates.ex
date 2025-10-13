defmodule FreelancerRates do
  def daily_rate(hourly_rate), do: hourly_rate * 8.0

  def apply_discount(before_discount, discount) do
    discount_percentage = discount / 100
    discount_value = before_discount * discount_percentage
    before_discount - discount_value
  end

  def monthly_rate(hourly_rate, discount) do
    monthly_rate = daily_rate(hourly_rate) * 22
    ceil(apply_discount(monthly_rate, discount))
  end

  def days_in_budget(budget, hourly_rate, discount) do
    daily_rate = daily_rate(hourly_rate)
    discounted_daily_rate = apply_discount(daily_rate, discount)
    Float.floor(budget / discounted_daily_rate, 1)
  end
end
