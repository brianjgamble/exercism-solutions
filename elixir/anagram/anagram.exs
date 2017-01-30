defmodule Anagram do
  def match(word, candidates) do
    Enum.filter(candidates, fn(x) -> 
      words_match?(String.downcase(word), String.downcase(x)) 
    end)
  end

  defp words_match?(word, word), do: false

  defp words_match?(word, another_word) do
    normalize(word) == normalize(another_word) 
  end

  defp normalize(word) do
    word 
      |> String.to_char_list 
      |> Enum.sort
  end
end
