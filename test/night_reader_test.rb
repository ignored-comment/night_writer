require './lib/filemanager'
require './lib/night_reader'

class NightReaderTest < Minitest::Test

  def test_it_exists
    night_reader = NightReader.new
    assert_instance_of NightReader, night_reader
  end

end
