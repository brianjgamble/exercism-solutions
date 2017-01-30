class Phrase < String
  def word_count
    words.each_with_object(Hash.new(0)) do |word, count|
      filtered_word = word.gsub(/^'|'$/, "")
      count[filtered_word] += 1 
    end
  end

  def words
    downcase.split(/[^'a-zA-Z0-9]+/)
  end
end
