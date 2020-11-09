class Dictionary 
  attr_reader :alphabet
  
  def initialize
   @alphabet = {
      'a' => ['0.', '..', '..'],
      'b' => ['0.', '0.', '..'],
      'c' => ['00', '..', '..'],
      'd' => ['00', '.0', '..'],
      'e' => ['0.', '.0', '..'],
      'f' => ['00', '0.', '..'],
      'g' => ['00', '00', '..'],
      'h' => ['0.', '00', '..'],
      'i' => ['.0', '0.', '..'],
      'j' => ['.0', '00', '..'],
      'k' => ['0.', '..', '0.'],
      'l' => ['0.', '0.', '0.'],
      'm' => ['00', '..', '0.'],
      'n' => ['00', '.0', '0.'],
      'o' => ['0.', '.0', '0.'],
      'p' => ['00', '0.', '0.'],
      'q' => ['00', '00', '0.'],
      'r' => ['0.', '00', '0.'],
      's' => ['.0', '0.', '0.'],
      't' => ['.0', '00', '0.'],
      'u' => ['0.', '..', '00'],
      'v' => ['0.', '0.', '00'],
      'w' => ['.0', '00', '.0'],
      'x' => ['00', '..', '00'],
      'y' => ['00', '.0', '00'],
      'z' => ['0.', '.0', '00'],
      ' ' => ['..', '..', '..']
      }
  end

  # English to Braille
  def translate_letter(letter)
    @alphabet[letter].collect do |braille_char|
      braille_char
    end
  end

  def translate_word(word)
    word.chars.collect do |letter|
      translate_letter(letter)
    end
  end

  def braille_split_top_mid_bottom(phrase)
    translate_word(phrase).transpose
  end

  def braille_columns_to_lines(phrase) 
    braille_split_top_mid_bottom(phrase).collect do |column|
      column.join(",") + "\n"
    end
  end

  def translator(phrase)
    braille_columns_to_lines(phrase).join(",").gsub(",","")
  end
  
  # Braille to English
  def num_of_letters(input)
    ((input.split[0].length) / 2)
  end

  def join_braille_characters(input)
    braille_chars = []
    positions = input.split("\n")
    num_of_letters(input).times do
      positions.each do |position|
        braille_chars << [position.slice!(0..1)]
      end
    end
    braille_chars.join
  end

  def separate_braille_chars(input)
    join_braille_characters(input).scan(/.{6}/)
  end

  def find_braille_character(input)
    require 'pry'; binding.pry
    separate_braille_chars(input).collect do |braille_letter|
      [braille_letter]
    end
  end

  def braille_dictionary
    @alphabet.invert
  end

  def join_braille_dictionary_keys(input)
    combined = {}
    braille_dictionary.each do |braille, letter|
      combined[[braille.join(" ").gsub(/\s+/, "")]] = letter
    end
    combined
  end

  def braille_translator(input)
    find_braille_character(input).each_with_object([]) do |braille, english|
      english << join_braille_dictionary_keys(input)[braille]
    end.join("")  
  end
end