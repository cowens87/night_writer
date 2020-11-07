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

  def write_message_to_braille
    writer = File.open(ARGV[1], 'w')
    output = writer.write(@incoming_message)
    puts "Created #{@output} containing #{@incoming_message.length} characters"
    writer.close
  end
end