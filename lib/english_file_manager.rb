class EnglishFileManager 
  attr_reader :incoming_message, :output
  
  def initialize(input, output)
    @input = input
    @output = output
    read_english_message
    write_message_to_braille
  end

  def read_english_message 
    input = File.open(ARGV[0], 'r')
    @incoming_message = input.read
    input.close
  end

  def downcase_characters
    @incoming_message.downcase
  end

  def write_message_to_braille
    writer = File.open(ARGV[1], 'w')
    output = writer.write(downcase_characters)
    puts "Created #{@output} containing #{@incoming_message.length} characters"
    writer.close
  end
end