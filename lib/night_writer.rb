require './lib/dictionary'

# handle        = File.open(ARGV[0], "r")
# message       = handle.read.downcase.chomp
# handle.close

# char_limit    = message.scan((/.{1,40}/))

# dictionary    = Dictionary.new

# final_message = char_limit.map {|line| dictionary.translator(line)}.join("\n")

# writer        = File.open(ARGV[1], "w")
# writer.write(final_message)
# writer.close

# puts "Created #{ARGV[1]} containing #{message.length} characters"

handle        = File.open(ARGV[0], "r")
message       = handle.read.downcase.chomp
handle.close

char_limit    = message.scan((/.{1,80}/))
final_message = char_limit[0]

dictionary    = Dictionary.new

translator    = dictionary.translator(final_message)
writer        = File.open(ARGV[1], "w")
writer.write(translator)
writer.close

puts "Created #{ARGV[1]} containing #{message.length} characters"