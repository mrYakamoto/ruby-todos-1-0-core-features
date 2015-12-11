class Item
  attr_accessor :name, :completed

  def initialize(array)
    @name = array[0]
    @compeleted = false
  end

  def display_name
    return "COMPLETED - #{@name}" if @completed
    @name
  end

end
