require './lib/translatable'

class EnglishTranslator 
  include Translatable

  def translate_letter(letter)
    alphabet[letter].collect do |braille_char|
      braille_char
    end
  end
end