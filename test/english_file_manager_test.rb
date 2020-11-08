require 'minitest/autorun'
require 'minitest/pride'
require './lib/english_file_manager'
require './lib/night_writer'

class EnglishFileManagerTest < Minitest::Test
  def setup
    input    = 'hello'
    output   = "0.0.0.0.0.\n00.00.0..0\n....0.0.0.\n"
    @manager = EnglishFileManager.new(input, output)
  end

  def test_it_exists_and_has_attributes
    assert_instance_of EnglishFileManager, @manager
  end

  # def test_it_can_read_a_file
  #   expected = 'Dear Wednesday I am sorry you are not Friday but at least you are not Monday or Sunday'
  #   assert_equal expected, @manager.read_english_message
  # end
end