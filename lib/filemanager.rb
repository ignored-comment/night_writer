class FileManager

  attr_reader :translator,
              :read_file

  def initialize
    @read_file = nil
    @translator = Translator.new(self)
  end

  def read(file)
    @read_file = File.read(file).chomp
  end

  def write(file)
    new_file = File.new(file)
    new_file.puts(@translator.limit_to_80_characters)
    new_file.close
  end
end
