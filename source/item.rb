class Item
  attr_accessor :name, :completed

  def initialize(array, completed="false")
    if array.class == Array
      @name = array[0]
    else
      @name = array
    end
    @completed = completed
  end

  def display_name
    return "COMPLETED - #{@name}" if @completed == "true"
    @name
  end

end
