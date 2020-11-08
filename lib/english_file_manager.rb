require './lib/dictionary'

class EnglishFileManager 
  attr_reader :incoming_message, :input, :output
  
  def initialize(input, output)
    @input  = input
    @output = output
    # read_english_message
    # write_message_to_braille
  end

  # def read_english_message 
  #   input = File.open(@input, 'r')
  #   @incoming_message = input.read.downcase.chomp
  #   input.close
  # end

  #  def character_limit
  #   @incoming_message.scan((/.{1,80}/))
  # end
  
  # def translate_characters
  #   character_limit.map do |phrase|
  #     Dictionary.new.translator(phrase)
  #   end.join('\n')
  # end
  
  # def write_message_to_braille
  #   writer = File.open(@output, 'w')
  #   output = writer.write(translate_characters)
  #   puts "Created #{@output} containing #{@incoming_message.length} characters"
  #   writer.close
  # end
end