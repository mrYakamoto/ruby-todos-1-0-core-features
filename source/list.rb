require_relative 'item'
require_relative 'parser'

class List

  def initialize(file_path, list_name)
    @list_name
    @list_arr = Parser.create_list_from_csv(file_path)
  end
  def add_item
    puts "\nWhat new thing would you like to add to the list?"
    new_item = gets_user_input
    @list_arr << Item.new([new_item])
    puts "Appended '#{new_item}' to #{@list_name}"
  end
  def gets_user_input
    gets.chomp
  end
  def display_list
    puts "\n#{@list_name}".upcase
    @list_arr.each_with_index { |item, index| puts "#{index+1}) #{item.display_name}" }
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
    @list_arr[item_index].completed = true
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
  def export
    puts "Please give me a csv file path to save to"
    file_path = gets.chomp
    Parser.save_to_csv(file_path, @list_arr)
    puts "saved to #{file_path}"
  end
end


