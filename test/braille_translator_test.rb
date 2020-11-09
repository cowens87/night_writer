require 'minitest/autorun'
require 'minitest/pride'
require './lib/braille_translator'

class BrailleTranslatorTest < Minitest::Test
  def setup
    @braille_translator = BrailleTranslator.new
  end

  def test_it_exists_and_has_attributes
    assert_instance_of BrailleTranslator, @braille_translator
  end

  def test_it_the_alphabet_has_been_reversed
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", 
      "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, @braille_translator.braille_dictionary.values
  end

  def test_it_can_translate_one_braille_character
    assert_equal 'g', @braille_translator.translate_braille_char(['00', '00', '..'])
  end
  
  def test_it_can_translate_multiple_characters
    input = [['00', '0.', '0.'], ['.0', '0.', '..'],['00', '00', '..']]
    assert_equal ["p", "i", "g"], @braille_translator.translate_braille_word(input)
  end

  def test_it_can_count_number_of_letters
    input    = "00.000.0..000.00\n0.0.000...0.0..0\n0.....0.....0.00\n"
    assert_equal 8, @braille_translator.num_of_letters(input)
    input    = "0..0\n000.\n....\n"
    assert_equal 2, @braille_translator.num_of_letters(input)
  end

  def test_it_can_convert_braille_input_into_linear_string
    input    = "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...\n"
    expected = "0.00..0..0..0.0.0.0.0.0.0..00........000.00..00.0.000.0.0.0.00.0.."
    assert_equal expected, @braille_translator.join_braille_characters(input)
  end

  def test_it_can_separate_braille_characters
    input    = "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...\n"
    expected = ["0.00..", "0..0..", "0.0.0.", "0.0.0.", "0..00.", "......", ".000.0", "0..00.", "0.000.", "0.0.0.", "00.0.."]
    assert_equal expected, @braille_translator.separate_braille_chars(input)
  end

  def test_it_can_find_braille_characters
    input    = "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...\n"
    assert_equal ['0.00..'], @braille_translator.find_braille_character(input).first
  end

  def test_it_can_join_braille_dictionary_keys
    input    = "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...\n"
    expected = ["0.00..", "0..0..", "0.0.0.", "0.0.0.", "0..00.", "......", ".000.0", "0..00.", "0.000.", "0.0.0.", "00.0.."]
    assert_equal expected, @braille_translator.join_braille_keys(input)
  end

  def test_it_can_translate_from_braille_to_english
    input    = "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...\n"
    assert_equal 'hello world', @braille_translator.braille_translator(input)
  end
end