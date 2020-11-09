require './lib/braille_translator'

handle             = File.open(ARGV[0], "r")
braille_message    = handle.read.chomp
handle.close

braillator         = BrailleTranslator.new
english            = braillator.braille_translator(braille_message)

writer             = File.open(ARGV[1], "w")
writer.write(english)
writer.close

# will need to count the translated file to get an accurate character count
puts "Created #{ARGV[1]} containing #{english.length} characters"