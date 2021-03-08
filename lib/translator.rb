class Translator

  attr_reader :library,
              :translated_data,
              :file_manager

  def initialize(file_manager)
    @translated_data = []
    @library = LettersLibrary.new
    @file_manager = file_manager
  end

  def translate_to_braille
    translation = []
    @file_manager.read_file.each_char do |character|
      translation << library.letters[character]
    end
    translation.compact
  end
end
