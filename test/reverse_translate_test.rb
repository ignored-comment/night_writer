require 'minitest/pride'
require 'minitest/autorun'
require './lib/letters_library'
require './lib/translator'
require './lib/reverse_translate'
require './lib/filemanager'

class ReverseTranslatorTest < Minitest::Test
  def test_it_exists
    manager = FileManager.new
    reverse = ReverseTranslator.new(manager)
    assert_instance_of ReverseTranslator, reverse
  end

  def test_it_has_readable_attributes
    manager = FileManager.new
    reverse = ReverseTranslator.new(manager)
    assert_equal [], reverse.translated_data
    assert_instance_of FileManager, reverse.file_manager
  end

  def test_it_can_format_to_individual_elements
    manager = FileManager.new
    reverse = ReverseTranslator.new(manager)
    manager.read("dummy_braille.txt")
    expected = [
      "0.",
      "00",
      "..",
      "0.",
      ".0",
      "..",
      "0.",
      "0.",
      "0.",
      "0.",
      "0.",
      "0.",
      "0.",
      ".0",
      "0."
    ]
    assert_equal expected, reverse.format_to_individual_elements
  end

  def test_it_can_format_to_hash_keys
    manager = FileManager.new
    reverse = ReverseTranslator.new(manager)
    manager.read("dummy_braille.txt")
    expected = [
      ["0.", "00", ".."],
      ["0.", ".0", ".."],
      ["0.", "0.", "0."],
      ["0.", "0.", "0."],
      ["0.", ".0", "0."]
    ]
    assert_equal expected, reverse.format_to_hash_keys
  end

  def test_it_can_translate_letters
    manager = FileManager.new
    reverse = ReverseTranslator.new(manager)
    manager.read("dummy_braille.txt")
    expected = "hello"
    assert_equal expected, reverse.translate
  end
end
