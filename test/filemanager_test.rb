require 'minitest/pride'
require 'minitest/autorun'
require './lib/letters_library'
require './lib/translator'
require './lib/filemanager'

class FileManagerTest < Minitest::Test
  def test_it_exists
    filemanager = FileManager.new
  end

  def test_it_has_readable_attributes
    filemanager = FileManager.new
    assert_instance_of Translator, filemanager.translator
    assert_nil nil, filemanager.read_file
  end

  def test_it_can_read_a_file
    filemanager = FileManager.new
    filemanager.read("message_dummy.txt").chomp
    expected = "hi this is a test\n"
    assert_equal expected, filemanager.read_file
  end

  def test_it_can_write_to_a_file
    filemanager = FileManager.new
    filemanager.read("message.txt").chomp
    filemanager.write("newtxt.txt")
    assert_instance_of File, "newtxt.txt"
  end
end
