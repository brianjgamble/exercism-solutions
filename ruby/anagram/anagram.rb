class Anagram < String
  def match(words)
    words.select { |word| !is_identical?(word) && is_anagram?(word) }
  end

  private

  def is_identical?(word)
    word.downcase == downcase
  end

  def is_anagram?(word)
    word.downcase.chars.sort == downcase.chars.sort 
  end
end
