defmodule PaintByNumber do
  def palette_bit_size(color_count, bit_count \\ 1) do
    if 2 ** bit_count >= color_count do 
      bit_count
    else 
      palette_bit_size(color_count, bit_count + 1)
    end
  end

  def empty_picture(), do: <<>>
  def test_picture(), do: <<0::2, 1::2, 2::2, 3::2>>
  def prepend_pixel(picture, color_count, pixel_color_index) do
    bit_size = palette_bit_size(color_count)
    <<pixel_color_index::size(bit_size), picture::bitstring>>
  end

  def get_first_pixel(<<>>, _color_count), do: nil
  def get_first_pixel(picture, color_count) do
    bit_size = palette_bit_size(color_count)
    <<first::size(bit_size), _tail::bitstring>> = picture
    first
  end

  def drop_first_pixel(<<>>, _color_count), do: <<>>
  def drop_first_pixel(picture, color_count) do
    bit_size = palette_bit_size(color_count)
    <<_first::size(bit_size), tail::bitstring>> = picture
    tail
  end

  def concat_pictures(picture1, picture2), do: <<picture1::bitstring, picture2::bitstring>>
  
end
