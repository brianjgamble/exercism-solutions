#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'rna_transcription'

# Test data version:
# deb225e Implement canonical dataset for scrabble-score problem (#255)

class ComplementTest < Minitest::Test
  def test_rna_complement_of_cytosine_is_guanine
    assert_equal 'G', Complement.of_dna('C')
  end

  def test_rna_complement_of_guanine_is_cytosine
    assert_equal 'C', Complement.of_dna('G')
  end

  def test_rna_complement_of_thymine_is_adenine
    assert_equal 'A', Complement.of_dna('T')
  end

  def test_rna_complement_of_adenine_is_uracil
    assert_equal 'U', Complement.of_dna('A')
  end

  def test_rna_complement
    assert_equal 'UGCACCAGAAUU', Complement.of_dna('ACGTGGTCTTAA')
  end

  def test_dna_correctly_handles_invalid_input
    assert_equal '', Complement.of_dna('U')
  end

  def test_dna_correctly_handles_completely_invalid_input
    assert_equal '', Complement.of_dna('XXX')
  end

  def test_dna_correctly_handles_partially_invalid_input
    assert_equal '', Complement.of_dna('ACGTXXXCTTAA')
  end
end
