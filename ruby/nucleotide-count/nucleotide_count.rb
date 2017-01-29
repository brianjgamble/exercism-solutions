class Nucleotide
  VALID_NUCLEOTIDES = "ACGTU"

  def self.from_dna(sequence)
    self.new(sequence)
  end

  def initialize(sequence)
    raise ArgumentError if !valid_dna?(sequence)
    @sequence = sequence
  end
  
  def count(target_symbol)
    return 0 if target_symbol.empty?
    raise ArgumentError if !nucleotide?(target_symbol)
    histogram.fetch(target_symbol, 0)
  end
  
  def histogram
    @sequence.chars.each_with_object(empty_nucleotide_hash) do |symbol, count|
      count[symbol] += 1
    end
  end
  
  private
  
  def valid_dna?(sequence)
    sequence.empty? || sequence.delete(VALID_NUCLEOTIDES).empty?
  end

  def nucleotide?(symbol)
    VALID_NUCLEOTIDES.include?(symbol)
  end
  
  def empty_nucleotide_hash
    {'A' => 0, 'T' => 0, 'C' => 0, 'G' => 0}
  end
end
