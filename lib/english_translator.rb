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
end