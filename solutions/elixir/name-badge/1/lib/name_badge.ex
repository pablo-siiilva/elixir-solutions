defmodule NameBadge do
  def print(id, name, department) do
    department =
      if department == nil do
        "OWNER"
      else
        String.upcase(department)
      end

    badge = "#{name} - #{department}"
    
    if id == nil do
      badge
    else
      badge = "[#{id}] - " <> badge
    end
  end
end
