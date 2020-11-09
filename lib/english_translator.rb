require './lib/translatable'

class EnglishTranslator 
  include Translatable

  def translate_letter(letter)
    alphabet[letter].collect do |braille_char|
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

  def final_braille(phrase)
    braille_columns_to_lines(phrase).join(",").gsub(",","")
  end
    def character_limit(phrase)
    phrase.scan(/.{1,40}/)
  end

  #  def translate_organized_message
  #   character_limit.map do |text|
  #     EnglishBraille.new.translator(text)
  #   end.join("\n")
  # end

  def translator(phrase)
     character_limit(phrase).map do |text|
      EnglishTranslator.new.final_braille(text)
    end.join("\n")
  end
end