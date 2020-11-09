require 'minitest/autorun'
require 'minitest/pride'
require './lib/english_translator'
require './lib/dictionary'

class EnglishTranslatorTest < Minitest::Test
  def setup
    @eng_translator = EnglishTranslator.new
  end

  def test_it_exists_and_has_attributes
    assert_instance_of EnglishTranslator, @eng_translator
  end

  def test_it_can_translate_one_letter_to_braille
    assert_equal ['0.', '00', '..'], @dictionary.translate_letter('h')
    assert_equal ["00", "..", "0."], @dictionary.translate_letter('m')
    assert_equal ['0.', '..', '00'], @dictionary.translate_letter('u')
  end


end