class Anagram < String
  def match(words)
    words.select do |word| 
      !identical?(word) && anagram?(word)
    end
  end

  private

  def identical?(word)
    word.downcase == downcase
  end

  def anagram?(word)
    word.downcase.chars.sort == downcase.chars.sort 
  end
end
