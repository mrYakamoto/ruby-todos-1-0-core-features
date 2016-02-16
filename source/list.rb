require_relative 'item'
require_relative 'CSVHelper'
require 'csv'

class List
  def initialize
    # puts "what would you like to name your to do list?"
    # @list_name = $stdin.gets.chomp
    @list_arr = []
    CSV.open('todo.csv', 'w')
    puts "New To Do List Created at './todo.csv'"
    CSVHelper.save_to_csv(@list_arr)
  end
  def self.add_item
    get_list_from_csv
    puts "\nWhat new thing would you like to add to the list?"
    new_item = gets_user_input
    @list_arr << Item.new([new_item])
    save_to_csv
    puts "Appended '#{new_item}' to todo.csv"
  end
  def self.gets_user_input
    $stdin.gets.chomp
  end
  def self.display_list
    get_list_from_csv
    # puts "\n#{@list_name}".upcase
    @list_arr.each_with_index { |item, index| puts "#{index+1}) #{item.display_name}" }
  end
   def self.delete_item
    get_list_from_csv
    display_list
    puts "\n0) Nevermind, I don't want to delete anything"
    puts "\nWhich thing would you like to remove from the list?"
    item_index = get_index
    puts "#{@list_arr[item_index].display_name} has been deleted"

    @list_arr.delete_at(item_index)
    save_to_csv
  end
   def self.complete_item
    get_list_from_csv
    display_list
    puts "\n0) Nevermind, I didn't complete anything"
    puts "\nWhich item did you complete?"
    item_index = get_index
    @list_arr[item_index].completed = "true"
    save_to_csv
  end
  def self.get_index
    puts "Give me the item's number."
    item_index = $stdin.gets.chomp.to_i
    return if item_index == 0
    if item_index > (@list_arr.length)
      puts "That number is out of range. Try again"
      get_index
    end
    item_index - 1
  end
  def self.export
    puts "Please give me a csv file path to save to"
    file_path = $stdin.gets.chomp
    CSVHelper.save_to_csv(file_path, @list_arr)
    puts "saved to #{file_path}"
  end
  def self.get_list_from_csv
    @list_arr = CSVHelper.create_list_from_csv
  end
  def self.save_to_csv
    CSVHelper.save_to_csv(@list_arr)
  end
end


