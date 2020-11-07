require 'minitest/autorun'
require 'minitest/pride'
require './lib/english_file_manager'

class EnglishFileManagerTest < Minitest::Test
  def setup
    input = ARGV[0]
    output = ARGV[1]
    @manager = EnglishFileManager.new(input, output)
  end

  def test_it_exists_and_has_attributes
    assert_instance_of EnglishFileManager, @manager
  end
end