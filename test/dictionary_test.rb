require 'minitest/autorun'
require 'minitest/pride'
require './lib/dictionary'

class DictionaryTest < Minitest::Test
  def setup
    @dictionary = Dictionary.new
  end

  def test_it_exists_and_has_attributes
    assert_instance_of Dictionary, @dictionary
  end

  def test_it_can_create_alphabet 
    expected = {
      'a' => ['0.', '..', '..'],
      'b' => ['0.', '0.', '..'],
      'c' => ['00', '..', '..'],
      'd' => ['00', '.0', '..'],
      'e' => ['0.', '.0', '..'],
      'f' => ['00', '0.', '..'],
      'g' => ['00', '00', '..'],
      'h' => ['0.', '00', '..'],
      'i' => ['.0', '0.', '..'],
      'j' => ['.0', '00', '..'],
      'k' => ['0.', '..', '0.'],
      'l' => ['0.', '0.', '0.'],
      'm' => ['00', '..', '0.'],
      'n' => ['00', '.0', '0.'],
      'o' => ['0.', '.0', '0.'],
      'p' => ['00', '0.', '0.'],
      'q' => ['00', '00', '0.'],
      'r' => ['0.', '00', '0.'],
      's' => ['.0', '0.', '0.'],
      't' => ['.0', '00', '0.'],
      'u' => ['0.', '..', '00'],
      'v' => ['0.', '0.', '00'],
      'w' => ['.0', '00', '.0'],
      'x' => ['00', '..', '00'],
      'y' => ['00', '.0', '00'],
      'z' => ['0.', '.0', '00'],
      ' ' => ['..', '..', '..']
      }
    assert_equal expected, @dictionary.alphabet
  end

  def test_it_can_translate_one_letter_to_braille
    assert_equal ['0.', '00', '..'], @dictionary.translate_letter('h')
  end

  def test_it_can_separate_a_word
    assert_equal ['p', 'i', 'g'], @dictionary.separate_word('pig')
  end

  def test_it_can_translate_one_word_to_braille 
    assert_equal [['00', '0.', '0.'], ['.0', '0.', '..'],['00', '00', '..']], @dictionary.translate_word('pig')
  end

  def test_it_can_convert_array_letter_to_letter_by_position
    expected = []
    assert_equal expected, @dictionary.braille_rows_to_columns('hi')
  end

  def test_it_can_create_braille_word_structure
    expected = "00.000.0..000.00\n0.0.000...0.0..0\n0.....0.....0.00\n"
    
    assert_equal expected, @dictionary.translator('pigs fly')
  end
end