defmodule Bob do
  def hey(text) do
    cond do
      Speech.is_question?(text) -> 
        "Sure."
      Speech.is_shouting?(text) -> 
        "Whoa, chill out!"
      Speech.is_silence?(text) ->
        "Fine. Be that way!"
      true ->
        "Whatever."
    end
  end
end

defmodule Speech do
  def is_silence?(text) do
    (text |> String.strip |> String.length) == 0
  end
  
  def is_shouting?(text) do
    !is_silence?(text) && (text == String.upcase text) && Regex.match?(~r/[^,?0-9\s]/, text)
  end
  
  def is_question?(text) do
    String.ends_with? text, "?"
  end  
end
