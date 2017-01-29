class Hamming
  def self.compute(strand, another_strand)
    StrandsComparer.new(strand, another_strand).count_differences
  end
end

class StrandsComparer
  def initialize(original, target)
    raise ArgumentError if (original.length != target.length)
    @strands = original.chars.zip(target.chars)
  end
  
  def count_differences
    @strands.select do |original_symbol, target_symbol| 
      (original_symbol != target_symbol) && !target_symbol.nil?
    end.count
  end
end
