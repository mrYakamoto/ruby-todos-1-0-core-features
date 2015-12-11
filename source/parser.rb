class Parser
  require 'csv'
  def self.create_list_from_csv(file_path)
    nested_array = CSV.read(file_path)
    transform_arrays_to_objects(nested_array)
  end

  def self.transform_arrays_to_objects(nested_array)
    nested_array.map! do |array_item|
      Item.new(array_item)
    end
  end

  def self.transform_objects_to_arrays(array_of_objects)
    array_of_objects.map! do |object|
      [object.display_name]
    end
  end

  def self.save_to_csv(file_path, list)
    list = Parser.transform_objects_to_arrays(list)
    CSV.open(file_path, 'w') do |csv_object|
      list.each do |row_array|
        csv_object << row_array
      end
    end
  end
end
