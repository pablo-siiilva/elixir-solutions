defmodule Secrets do
  def secret_add(first_number) do
    fn second_number ->
      first_number + second_number
    end
  end

  def secret_subtract(first_number) do
    fn second_number ->
      second_number - first_number
    end
  end

  def secret_multiply(first_number) do
    fn second_number ->
      first_number * second_number
    end
  end

  def secret_divide(first_number) do
    fn second_number ->
      div(second_number, first_number)
    end
  end

  def secret_and(first_number) do
    fn second_number ->
      Bitwise.band(first_number, second_number)
    end
  end

  def secret_xor(first_number) do
    fn second_number ->
      Bitwise.bxor(first_number, second_number)
    end
  end

  def secret_combine(secret_function1, secret_function2) do
    fn number ->
      secret_function2.(secret_function1.(number))
    end
  end
end
