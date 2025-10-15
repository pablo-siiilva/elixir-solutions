defmodule HighSchoolSweetheart do
  def first_letter(name), do: String.trim(name) 
                              |> String.first()

  def initial(name), do: first_letter(name)  
                              |> String.upcase()
                              |> Kernel.<>(".")
                              
  def initials(full_name) do 
    [first_name, second_name] = String.split(full_name)
    initial(first_name) <> " " <> initial(second_name)
  end

  def pair(full_name1, full_name2) do
    first_initials = initials(full_name1)
    second_initials = initials(full_name2)
    """
    ❤-------------------❤
    |  #{first_initials}  +  #{second_initials}  |
    ❤-------------------❤
    """
  end

end
