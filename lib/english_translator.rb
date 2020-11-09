require './lib/translatable'

class EnglishTranslator 
  include Translatable

  def translate_letter(letter)
    lookup(letter).collect do |braille_char|
      braille_char
    end
  end

    def translate_word(word)
    word.chars.collect do |letter|
      translate_letter(letter)
    end
  end
end