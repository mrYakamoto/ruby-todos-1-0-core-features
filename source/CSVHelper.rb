class CSVHelper
  require 'csv'
  def self.create_list_from_csv
    nested_arrays = CSV.read('./todo.csv')
    # unless nested_arrays[0] == nil
      transform_arrays_to_objects(nested_arrays)
    # end
  end

  def self.transform_arrays_to_objects(nested_array)
    nested_array.map! do |array_item|
      Item.new(array_item[0], array_item[1])
    end
    nested_array
  end

  def self.transform_objects_to_arrays(array_of_objects)
    if array_of_objects != nil
      array_of_objects.map! do |object|
        arr = [object.display_name]
        arr << object.completed
      end
    end
  end

  def self.save_to_csv(list_array)
    list = CSVHelper.transform_objects_to_arrays(list_array)
    CSV.open('todo.csv', 'w') do |csv_object|
      if list != nil
        list.each do |row_array|
          csv_object << row_array
        end
      end
    end
  end
end
