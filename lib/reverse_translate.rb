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
    line_1 = []
    line_2 = []
    line_3 = []
    split = @file_manager.read_file.downcase.split("\n")
    require "pry"; binding.pry
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
