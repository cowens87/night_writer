require './lib/braille_translator'

handle             = File.open(ARGV[0], "r")
braille_message    = handle.read.chomp
handle.close

braillator         = BrailleTranslator.new
text               = braillator.braille_translator(braille_message)
# final_braille      = text.scan(/.{1,80}/)+"\n"

# braille_translator = dictionary.braille_translator(final_braille)
writer             = File.open(ARGV[1], "w")
writer.write(final_braille)
writer.close

# will need to count the translated file to get an accurate character count
puts "Created #{ARGV[1]} containing #{text.length} characters"