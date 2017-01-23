defmodule Words do
  @doc """
  Counts the occurences of each word in the given phrase treating
  each word as case-insensitive.  
  """
  def count(string) do
    words = string |> Text.as_words
    count_words(words)
  end
        
  defp count_words(words) do
    Enum.reduce words, HashDict.new, count_word(&1, &2)
  end
  
  defp count_word(word, dict) do
    HashDict.update dict, word |> String.downcase, 1, &1 + 1
  end
end

defmodule Text do
  @doc """
  Converts a given string into a collection of alphanumeric words.
  """
  def as_words(string) do
    string
      |> String.split(%r{\W}) 
      |> Enum.reject(is_empty? &1)    
  end
  
  defp is_empty?(string), do: String.length(string) == 0
end