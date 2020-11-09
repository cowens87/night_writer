require './test/test_helper'
require './lib/braille_translator'

class BrailleTranslatorTest < Minitest::Test
  def setup
    @braillator = BrailleTranslator.new
  end

  def test_it_exists_and_has_attributes
    assert_instance_of BrailleTranslator, @braillator
  end

  def test_the_alphabet_has_been_reversed
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", 
      "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, @braillator.braille_dictionary.values
  end

  def test_it_can_translate_one_braille_character
    assert_equal 'g', @braillator.translate_braille_char(['00', '00', '..'])
  end
  
  def test_it_can_translate_multiple_characters
    input = [['00', '0.', '0.'], ['.0', '0.', '..'],['00', '00', '..']]
    assert_equal ["p", "i", "g"], @braillator.translate_braille_word(input)
  end

  def test_it_can_count_number_of_letters
    input    = "00.000.0..000.00\n0.0.000...0.0..0\n0.....0.....0.00\n"
    assert_equal 8, @braillator.num_of_letters(input)
    input    = "0..0\n000.\n....\n"
    assert_equal 2, @braillator.num_of_letters(input)
  end

  def test_it_can_convert_braille_input_into_linear_string
    input    = "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...\n"
    expected = "0.00..0..0..0.0.0.0.0.0.0..00........000.00..00.0.000.0.0.0.00.0.."
    assert_equal expected, @braillator.join_braille_characters(input)
  end

  def test_it_can_separate_braille_characters
    input    = "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...\n"
    expected = ["0.00..", "0..0..", "0.0.0.", "0.0.0.", "0..00.", "......", 
                ".000.0", "0..00.", "0.000.", "0.0.0.", "00.0.."]
    assert_equal expected, @braillator.separate_braille_chars(input)
  end

  def test_it_can_find_braille_characters
    input    = "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...\n"
    assert_equal ['0.00..'], @braillator.find_braille_character(input).first
  end

  def test_it_can_join_braille_dictionary_keys
    input    = "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...\n"
    expected = {
                ["0....."]=>"a", ["0.0..."]=>"b", ["00...."]=>"c", ["00.0.."]=>"d", 
                ["0..0.."]=>"e", ["000..."]=>"f", ["0000.."]=>"g", ["0.00.."]=>"h", 
                [".00..."]=>"i", [".000.."]=>"j", ["0...0."]=>"k", ["0.0.0."]=>"l", 
                ["00..0."]=>"m", ["00.00."]=>"n", ["0..00."]=>"o", ["000.0."]=>"p", 
                ["00000."]=>"q", ["0.000."]=>"r", [".00.0."]=>"s", [".0000."]=>"t", 
                ["0...00"]=>"u", ["0.0.00"]=>"v", [".000.0"]=>"w", ["00..00"]=>"x", 
                ["00.000"]=>"y", ["0..000"]=>"z", ["......"]=>" "
              }
    assert_equal expected, @braillator.join_braille_dictionary_keys(input)
  end

  def test_it_can_translate_from_braille_to_english
    input    = "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...\n"
    assert_equal 'hello world', @braillator.braille_translator(input)
    input    = "0..0\n000.\n....\n"
    assert_equal 'hi', @braillator.braille_translator(input)
  end
end