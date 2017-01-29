class Complement
  RNA_STRANDS = { 'G' => 'C',
                  'C' => 'G',
                  'T' => 'A',
                  'A' => 'U' }

  def self.of_dna(strand)
    Complement.new(strand).to_rna
  end

  def initialize(strand)
    @strand = strand
  end

  def to_rna
    "".tap do |conversion|
      if valid_strand?
        @strand.chars.each do |ch|
          conversion << RNA_STRANDS[ch]
        end
      end
    end
  end

  def valid_strand?
    /[^GCTA]/.match(@strand) == nil
  end
end
