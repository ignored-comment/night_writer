require './lib/translator'
require './lib/reverse_translate'

class FileManager

  attr_reader :translator,
              :read_file,
              :reverse

  def initialize
    @read_file = nil
    @translator = Translator.new(self)
    @reverse = ReverseTranslator.new(self)
  end

  def read(file)
    @read_file = File.read(file).chomp
  end

  def write_braille(file)
    new_file = File.new(file, "w")
    new_file.puts(@translator.limit_to_80_characters)
    new_file.close
  end

  def write_english(file)
    new_file = File.new(file, "w")
    new_file.puts(@reverse.translate)
    new_file.close
  end
end
