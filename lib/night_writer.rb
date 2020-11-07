  input = File.open(ARGV[0], 'r')
  input_message = input.read
  input.close

  lowercased = input_message.downcase

  writer = File.open(ARGV[1], 'w')
  output = writer.write(lowercased)
  writer.close

  puts "Created #{ARGV[1]} containing #{lowercased.length} characters"