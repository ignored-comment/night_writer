class FileManager

  attr_reader :translator,
              :read_file

  def initialize
    @read_file = nil
    @translator = Translator.new(self)
  end

  def read(file)
    @read_file = File.read(file)
  end

end
