class EnglishFileManager 
  attr_reader :incoming_message, :output
  
  def initialize(input, output)
    @input = input
    @output = output
  end

  def read_english_message 
    input = File.open(ARGV[0], 'r')
    @incoming_message = input.read
    input.close
  end
end