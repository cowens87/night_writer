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
end