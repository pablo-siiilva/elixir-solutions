defmodule BirdCount do
  def today([]), do: nil
  def today([head]), do: head
  def today([head | _tail]), do: head

  def increment_day_count([]), do: [1]
  def increment_day_count([head]), do: [head + 1]
  def increment_day_count([head | tail]), do: [head + 1 | tail]

  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([head]), do: head == 0
  def has_day_without_birds?([head | tail]), do: head == 0 or has_day_without_birds?(tail)

  def total([]), do: 0
  def total([head]), do: head
  def total([head | tail]), do: head + total(tail)

  def busy_days([]), do: 0
  def busy_days([head]), do: busy_day(head)
  def busy_days([head | tail]), do: busy_day(head) + busy_days(tail)
  defp busy_day(day), do: if (day >= 5), do: 1, else: 0
end
