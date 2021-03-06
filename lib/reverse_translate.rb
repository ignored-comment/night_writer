require 'minitest/pride'
require 'minitest/autorun'
require './lib/letters_library'
require './lib/translator'
require './lib/reverse_translate'
require './lib/filemanager'

class ReverseTranslator

  attr_reader :library,
              :translated_data,
              :file_manager

  def initialize(file_manager)
    @translated_data = []
    @library = LettersLibrary.new
    @file_manager = file_manager
  end

  def format_to_individual_elements
    result = []
    split = @file_manager.read_file.downcase.split("\n")
    until split[0].length == 0
      result.push(split[0].slice!(0..1), split[1].slice!(0..1), split[2].slice!(0..1))
    end
    result
  end

  def format_to_hash_keys
    result = format_to_individual_elements
    array_of_three_elements = []
    until result.length == 0
      array_of_three_elements << result.slice!(0..2)
    end
    array_of_three_elements
  end

  def translate
    translated_array = []
    format_to_hash_keys.each do |key|
      translated_array << @library.braille[key]
    end
    @translated_data = translated_array.join
  end
end
