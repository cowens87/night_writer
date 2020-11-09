require 'minitest/autorun'
require 'minitest/pride'
require './lib/english_translator'

class EnglishTranslatorTest < Minitest::Test
  def setup
    @english_translator = EnglishTranslator.new
  end

  def test_it_exists_and_has_attributes
    assert_instance_of EnglishTranslator, @english_translator
  end

  def test_it_can_translate_one_letter_to_braille
    assert_equal ['0.', '00', '..'], @english_translator.translate_letter('h')
    assert_equal ["00", "..", "0."], @english_translator.translate_letter('m')
    assert_equal ['0.', '..', '00'], @english_translator.translate_letter('u')
  end

  def test_it_can_translate_one_word_to_braille 
    expected = [['00', '0.', '0.'], ['.0', '0.', '..'],['00', '00', '..']]
    assert_equal expected, @english_translator.translate_word('pig')
    expected = [["00", "0.", "0."], ["0.", ".0", "0."], ["00", "0.", "0."]]
    assert_equal expected, @english_translator.translate_word('pop')
    expected = [["00", ".0", ".."], ["0.", "..", ".."], ["00", ".0", ".."]]
    assert_equal expected, @english_translator.translate_word('dad')
  end

    def test_it_can_break_each_letter_down_by_top_middle_and_bottom_index
    expected = [["0.", ".0"], ["00", "0."], ["..", ".."]]
    assert_equal expected, @english_translator.braille_split_top_mid_bottom('hi')
    expected = [["00", "0."], [".0", ".0"], ["0.", "0."]]
    assert_equal expected, @english_translator.braille_split_top_mid_bottom('no')
  end

  def test_it_can_convert_braille_array_into_linear_lines
    expected = ["0.,.0\n", "00,0.\n", "..,..\n"]
    assert_equal expected, @english_translator.braille_columns_to_lines('hi')
    expected = ["00,0.\n", ".0,.0\n", "0.,0.\n"]
    assert_equal expected, @english_translator.braille_columns_to_lines('no')
  end

  def test_it_can_create_braille_word_structure
    expected = "00.000.0..000.00\n0.0.000...0.0..0\n0.....0.....0.00\n"
    assert_equal expected, @english_translator.translator('pigs fly')
    expected = "0..0\n000.\n....\n"
    assert_equal expected, @english_translator.translator('hi')
  end
end