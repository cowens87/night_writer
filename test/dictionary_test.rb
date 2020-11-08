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

  def test_it_can_create_an_alphabet 
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
    assert_equal ["00", "..", "0."], @dictionary.translate_letter('m')
    assert_equal ['0.', '..', '00'], @dictionary.translate_letter('u')
  end

  def test_it_can_translate_one_word_to_braille 
    assert_equal [['00', '0.', '0.'], ['.0', '0.', '..'],['00', '00', '..']], @dictionary.translate_word('pig')
    assert_equal [["00", "0.", "0."], ["0.", ".0", "0."], ["00", "0.", "0."]], @dictionary.translate_word('pop')
    assert_equal [["00", ".0", ".."], ["0.", "..", ".."], ["00", ".0", ".."]], @dictionary.translate_word('dad')
  end

  def test_it_can_break_each_letter_down_by_top_middle_and_bottom_index
    expected = [["0.", ".0"], ["00", "0."], ["..", ".."]]
    assert_equal expected, @dictionary.braille_split_top_mid_bottom('hi')
    expected = [["00", "0."], [".0", ".0"], ["0.", "0."]]
    assert_equal expected, @dictionary.braille_split_top_mid_bottom('no')
  end

  def test_it_can_convert_braille_array_into_linear_lines
    expected = ["0.,.0\n", "00,0.\n", "..,..\n"]
    assert_equal expected, @dictionary.braille_columns_to_lines('hi')
    expected = ["00,0.\n", ".0,.0\n", "0.,0.\n"]
    assert_equal expected, @dictionary.braille_columns_to_lines('no')
  end

  def test_it_can_create_braille_word_structure
    expected = "00.000.0..000.00\n0.0.000...0.0..0\n0.....0.....0.00\n"
    assert_equal expected, @dictionary.translator('pigs fly')
    expected = "0..0\n000.\n....\n"
    assert_equal expected, @dictionary.translator('hi')
  end
end