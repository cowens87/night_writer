require './lib/english_translator'

handle        = File.open(ARGV[0], "r")
message       = handle.read.downcase.chomp
handle.close

englator      = EnglishTranslator.new

writer        = File.open(ARGV[1], "w")
writer.write(englator.translator(message))
writer.close

puts "Created #{ARGV[1]} containing #{message.length} characters"