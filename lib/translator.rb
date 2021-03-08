class Translator

  attr_reader :library,
              :translated_data,
              :file_manager

  def initialize(file_manager)
    @translated_data = []
    @library = LettersLibrary.new
    @file_manager = file_manager
  end

  def line_one
    translation = []
    @file_manager.read_file.each_char do |character|
      translation << library.letters[character][0]
    end
    translation
  end

  def line_two
    translation = []
    @file_manager.read_file.each_char do |character|
      translation << library.letters[character][1]
    end
    translation
  end

  def line_three
    translation = []
    @file_manager.read_file.each_char do |character|
      translation << library.letters[character][2]
    end
    translation
  end

  def limit_to_80_characters
    line_1 = line_one
    line_2 = line_two
    line_3 = line_three
    until line_1.length == 0
      @translated_data << line_1.slice!(0..79)
      @translated_data << "\n"
      @translated_data << line_2.slice!(0..79)
      @translated_data << "\n"
      @translated_data << line_3.slice!(0..79)
      @translated_data << "\n"
    end
    @translated_data.join
  end
end
