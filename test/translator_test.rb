require 'minitest/pride'
require 'minitest/autorun'
require './lib/letters_library'
require './lib/translator'
require './lib/filemanager'

class TranslatorTest < Minitest::Test
  def test_it_exists
    manager = FileManager.new
    translator = Translator.new(manager)
    assert_instance_of Translator, translator
  end

  def test_it_has_readable_attributes
    manager = FileManager.new
    translator = Translator.new(manager)
    assert_instance_of LettersLibrary, translator.library
    assert_equal [], translator.translated_data
    assert_instance_of FileManager, translator.file_manager
  end

  def test_it_can_translate_words
    manager = FileManager.new
    translator = Translator.new(manager)
    manager.read("message.txt")
    translator.translate_to_braille
    assert_equal "lol", translator.translated_data
  end
end
