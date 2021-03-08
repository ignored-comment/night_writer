module Messageable

  def argv_message
    puts "This is the Night Writer Help Desk:"
    puts "Your first argument must be 'message.txt', no quotes."
    puts "Your second argument can be any file name you choose,"
    puts "but it must end with '.txt', no quotes."
    puts "Navigate, open, and write a nice message in the 'message.txt' file."
    puts "Then, after including the first argument of 'message.txt',"
    puts "assign a filename of your choice to the second argument."
    puts "Make sure both arguments end with a '.txt'"
    puts "At the end of it all, you'll see a nicely translated message"
    puts "from English to Braille. :)"
    puts "Happy Braille-ing!"
  end

  def confirmation_message(read_file, output_file)
    puts "You've requested to read '#{read_file}'"
    puts "and output the translated file to '#{output_file}'"
    puts "Is that correct? Type 'y' for yes, 'n' for no. No quotes."
  end

  def start_over_message
    puts "Sorry Capt'n! You either confirmed 'no' or you wrote something"
    puts "other than 'y' or 'n'. Try again!"
  end

  def task_completed_message(output_file, character_length)
    puts "Created '#{output_file}' containing #{character_length} characters."
  end
end
