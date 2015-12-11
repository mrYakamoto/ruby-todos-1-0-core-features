require_relative 'list'

my_todo = List.new('todo.csv', "Gregg's List")
my_todo.display_list
my_todo.add_item
my_todo.delete_item
my_todo.complete_item
my_todo.export
