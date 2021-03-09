require './lib/messageable'
require './lib/filemanager'

class NightReader

  extend Messageable

  argv = ARGV
  unless argv.length == 2 && argv[0] == 'braille.txt'
    puts argv_help_message
  end

  if argv.length == 2 && argv[0] == 'braille.txt'
    confirmation_message(argv[0], argv[1])
    print "> "
    user_input = $stdin.gets.chomp
    if user_input.downcase == 'y'
      file = FileManager.new
      file.read(argv[0])
      file.write_english(argv[1])
      output_file_length = File.read(argv[1]).length
      puts task_completed_message(argv[1], output_file_length)
    elsif user_input.downcase == 'n'
      puts start_over_message
    end
  end
end
