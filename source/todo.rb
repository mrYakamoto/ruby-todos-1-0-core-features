# What classes do you need?
# List(model)
# CSVParser(storage)
# Display(view)

# Remember, there are four high-level responsibilities, each of which have multiple sub-responsibilities:
# 1. Gathering user input and taking the appropriate action (controller)
# 2. Displaying information to the user (view)
# 3. Reading and writing from the todo.txt file (persisting models to non-volatile storage, aka "the hard drive")
# 4. Manipulating the in-memory objects that model a real-life TODO list (model)

# Note that (4) is where the essence of your application lives.
# Pretty much every application in the universe has some version of responsibilities (1), (2), and (3).

require_relative 'list'

valid_commands = ["initialize", "list", "add", "delete", "complete"]

if ARGV.empty?
  print_valid_commands
end

command = ARGV[0]
case command
when "initialize"
  List.new
when "list"
  List.display_list
when "add"
  List.add_item
when "delete"
  List.delete_item
when "complete"

else
  print_valid_commands
end


def print_valid_commands
  puts "valid commands are..."
  valid_commands.each {|command| puts command}
end




