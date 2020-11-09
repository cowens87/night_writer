require './lib/dictionary'

handle             = File.open(ARGV[0], "r")
braille_message    = handle.read.chomp
handle.close

dictionary         = Dictionary.new
text               = dictionary.braille_translator(braille_message)
require 'pry'; binding.pry
final_braille      = text.scan(/.{1,80}/)+"\n"
braille_translator = dictionary.braille_translator(final_braille)
writer             = File.open(ARGV[1], "w")
writer.write(braille_translator)
writer.close

# will need to count the translated file to get an accurate character count
puts "Created #{ARGV[1]} containing #{braille_message.length} characters"