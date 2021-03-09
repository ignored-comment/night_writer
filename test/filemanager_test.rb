require 'minitest/pride'
require 'minitest/autorun'
require './lib/letters_library'
require './lib/translator'
require './lib/reverse_translate'
require './lib/filemanager'

class FileManagerTest < Minitest::Test
  def test_it_exists
    filemanager = FileManager.new
  end

  def test_it_has_readable_attributes
    filemanager = FileManager.new
    assert_instance_of Translator, filemanager.translator
    assert_instance_of ReverseTranslator, filemanager.reverse
    assert_nil nil, filemanager.read_file
  end

  def test_it_can_read_a_file
    filemanager = FileManager.new
    filemanager.read("message.txt")
    expected = "hi this is a test to see if my characters will wrap around at a limit of eighty characters"
    assert_equal expected, filemanager.read_file
  end

  def test_it_can_write_to_a_file_in_braille
    filemanager = FileManager.new
    filemanager.read("message.txt").chomp
    filemanager.write_braille("braille_txt_manager_test.txt")
    assert_instance_of String, File.read("braille_txt_manager_test.txt")
  end
end
