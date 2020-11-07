class EnglishFileManager 
  attr_reader :input, :output
  
  def initialize(input, output)
    @input = input
    @output = output
  end

  def read_english_message 
    input = File.open(ARGV[0], 'r')
    input_message = input.read
    input.close
  end
end