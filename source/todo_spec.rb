require_relative 'todo'

describe "ToDo" do
  let(:my_to_do){ToDo.new("Gregg's To Do List", './todo.csv')}

  describe "initialize" do
    it "initalizes a new Todo Class item" do
      expect(my_to_do.class).to be(ToDo)
    end
    it "initializes @name variable" do
      expect(my_to_do.name).to eq("Gregg's To Do List")
    end
    it "@list_arr is an array" do
      array = my_to_do.list_arr
      expect(array.class).to be(Array)
    end
    it "csv lines are stored in @list_arr as a nested array" do
      expect(my_to_do.list_arr[1][0]).to eq("Lose Lil to Danny")
    end
  end

  describe "add_item" do
    it "adds a new item to @list_arr" do
      my_to_do.add_item("feed dog")
      expect(my_to_do.list_arr.pop()).to eq(["feed dog"])
    end
  end

  describe "delete_item" do
    it "removes item from @list_arr" do
    end
  end

  describe "complete item" do
    it "marks an item as completed" do
    end
  end
end
