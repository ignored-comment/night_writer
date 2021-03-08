require 'minitest/pride'
require 'minitest/autorun'
require './lib/letters_library'

class LettersLibraryTest < Minitest::Test
  def test_it_exists
    letters_library = LettersLibrary.new
    assert_instance_of LettersLibrary, letters_library
  end

  def test_it_has_readable_attributes
    letters_library = LettersLibrary.new
    expected = ["0.", "..", ".."]
    assert_equal expected, letters_library.letters["a"]
  end
end
