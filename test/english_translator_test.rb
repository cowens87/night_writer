require 'minitest/autorun'
require 'minitest/pride'
require './lib/english_translator'
require './lib/dictionary'

class EnglishTranslatorTest < Minitest::Test
  def setup
    @eng_translator = EnglishTranslator.new
  end

  def test_it_exists_and_has_attributes
    assert_instance_of EnglishTranslatorTest, @eng_translator
  end
end