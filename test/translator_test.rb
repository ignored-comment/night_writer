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

  def test_it_can_translate_letters_from_line_one
    manager = FileManager.new
    translator = Translator.new(manager)
    manager.read("message_dummy.txt")
    expected = [
    "0.",
    ".0",
    "..",
    ".0",
    "0.",
    ".0",
    ".0",
    "..",
    ".0",
    ".0",
    "..",
    "0.",
    "..",
    ".0",
    "0.",
    ".0",
    ".0"
    ]
    assert_equal expected, translator.line_one
  end

  def test_it_can_translate_letters_from_line_two
    manager = FileManager.new
    translator = Translator.new(manager)
    manager.read("message_dummy.txt")
    expected = [
      "00",
      "0.",
      "..",
      "00",
      "00",
      "0.",
      "0.",
      "..",
      "0.",
      "0.",
      "..",
      "..",
      "..",
      "00",
      ".0",
      "0.",
      "00"
    ]
    assert_equal expected, translator.line_two
  end

  def test_it_can_translate_letters_from_line_three
    manager = FileManager.new
    translator = Translator.new(manager)
    manager.read("message_dummy.txt")
    expected = [
      "..",
      "..",
      "..",
      "0.",
      "..",
      "..",
      "0.",
      "..",
      "..",
      "0.",
      "..",
      "..",
      "..",
      "0.",
      "..",
      "0.",
      "0."
    ]
    assert_equal expected, translator.line_three
  end

  def test_it_can_limit_characters_to_80_characters
    manager = FileManager.new
    translator = Translator.new(manager)
    manager.read("message.txt")
    translator.limit_to_80_characters
    assert_instance_of Array, translator.translated_data
  end
end
