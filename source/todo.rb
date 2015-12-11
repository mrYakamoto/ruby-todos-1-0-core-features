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

class ToDo
  attr_reader :list_arr, :name

  def initialize(list_name, csv_file_path)
    # @list_name = list_name
    # @list_arr = CSV.read(csv_file_path)
    # @csv_file_path
  end

  def add_item
    puts "What new thing would you like to add to the list?"
    new_item = gets_user_input
    @list_arr << new_item.split("",1)
  end

  def gets_user_input
    gets.chomp
  end

  def display_list
    puts "\n#{@list_name}".upcase
    @list_arr.each_with_index { |item, index| puts "#{index+1}) #{item[0]}" }
  end

  def delete_item
    display_list
    puts "\n0) Nevermind, I don't want to delete anything"
    puts "\nWhich thing would you like to remove from the list?"
    item_index = get_index
    @list_arr.delete_at(item_index)
  end

  def complete_item
    display_list
    puts "\n0) Nevermind, I didn't complete anything"
    puts "\nWhich item did you complete?"
    item_index = get_index
    @list_arr[item_index][0] = "COMPLETED - #{list_arr[item_index][0]}"
  end

  def get_index
    puts "Give me the item's number."
    item_index = gets.chomp.to_i
    return if item_index == 0
    if item_index > (@list_arr.length)
      puts "That number is out of range. Try again"
      get_index
    end
    item_index - 1
  end
end

my_list = ToDo.new("Gregg's List", '.todo/.csv')
my_list.delete_item
my_list.display_list
my_list.complete_item
my_list.display_list
my_list.save_to_csv('test.csv')
