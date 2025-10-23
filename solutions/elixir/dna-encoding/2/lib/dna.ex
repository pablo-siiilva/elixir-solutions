defmodule DNA do
  def encode_nucleotide(code_point) do
    case code_point do
      ?\s -> 0b0000
      ?A -> 0b0001
      ?C -> 0b0010
      ?G -> 0b0100
      ?T -> 0b1000
    end
  end

  def decode_nucleotide(encoded_code) do
    case encoded_code do
      0b0000 -> ?\s
      0b0001 -> ?A
      0b0010 -> ?C
      0b0100 -> ?G
      0b1000 -> ?T
    end
  end

  def encode([]), do: <<>>
  def encode([head | tail]), do: <<encode_nucleotide(head)::size(4), encode(tail)::bitstring>>

  def decode(dna), do: do_decode(dna, [])

  defp do_decode(<<>>, acc), do: reverse(acc)
  defp do_decode(<<head::4, rest::bitstring>>, acc), do: do_decode(rest, [decode_nucleotide(head) | acc])

  defp reverse(acc, list \\ [])
  defp reverse([], list), do: list
  defp reverse([head | rest], list), do: reverse(rest, [head | list])
  
end
