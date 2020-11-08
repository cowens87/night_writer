require './lib/dictionary'

handle             = File.open(ARGV[0], "r")
message            = handle.read.chomp
handle.close

dictionary         = Dictionary.new

braille_translator = dictionary.translator(final_message)
writer             = File.open(ARGV[1], "w")
writer.write(translator)
writer.close

puts "Created #{ARGV[1]} containing #{message.length} characters"