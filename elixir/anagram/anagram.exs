defmodule Anagram do
  def match(word, candidates) do
    Enum.filter candidates, words_match?(word, &1) 
  end

  defp words_match?(_word, _word), do: false

  defp words_match?(word, another_word) do
    normalize(word) == normalize(another_word) 
  end

  defp normalize(word) do
    {:ok, list} = word |> String.downcase |> String.to_char_list
    Enum.sort list
  end
end