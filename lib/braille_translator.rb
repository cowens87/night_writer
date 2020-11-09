require './module/translatable'

class BrailleTranslator 
  include Translatable

  def braille_dictionary
    alphabet.invert
  end

  def translate_braille_char(symbol)
    lookup_character(symbol)[0]
  end

  def translate_braille_word(symbols)
    symbols.collect do |symbol|
      translate_braille_char(symbol)
    end
  end
  
  def num_of_letters(input)
    ((input.split[0].length) / 2)
  end

  def join_braille_characters(input)
    # braille_chars = []
    # positions = input.split("\n")
    # num_of_letters(input).times do
    #   positions.each do |position|
    #     braille_chars << [position.slice!(0..1)]
    #   end
    # end
    # braille_chars.join

    positions = input.split("\n")
    num_of_letters(input).times do
      positions.each_with_object([]) do |position, braille_chars|
        braille_chars << [position.slice!(0..1)]
      end
    end.join
    # braille_chars.join
  end

  def separate_braille_chars(input)
    join_braille_characters(input).scan(/.{6}/)
  end

  def find_braille_character(input)
    separate_braille_chars(input).collect do |braille_letter|
      [braille_letter]
    end
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