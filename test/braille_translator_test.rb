require 'minitest/autorun'
require 'minitest/pride'
require './lib/braille_translator'

class Test < Minitest::Test
  def setup
    braille_translator = BrailleTranslator.new
  end

  def test_it_exists_and_has_attributes
    assert_instance_of ,
    assert_equal ,
  end
end