require './lib/english_translator'

handle        = File.open(ARGV[0], "r")
message       = handle.read.downcase.chomp
handle.close

# char_limit    = message.scan((/.{1,80}/))
# final_message = char_limit[0]

englator      = EnglishTranslator.new

# translator    = englator.translator(final_message)
translator    = englator.translator(message)
writer        = File.open(ARGV[1], "w")
writer.write(translator)
writer.close

puts "Created #{ARGV[1]} containing #{message.length} characters"