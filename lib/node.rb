class Node
  attr_reader :data
  attr_accessor :next_node

  def initialize(data)
    @data = data
    @next_node = nil
  end

  def append_node(data)
    if @next_node.nil?
      @next_node = Node.new(data)
    else
      @next_node.append_node(data)
    end
  end

  def insert_node(position, data)
    if position == 0
      remainder_of_list = self.clone
      @next_node = remainder_of_list
      @data = data
    else
      @next_node.insert_node(position - 1, data)
    end
  end

  def count_nodes(counter = 1)
    if @next_node.nil?
      counter
    else
      @next_node.count_nodes(counter + 1)
    end
  end

  def generate_string(string = self.data)
    if @next_node.nil?
      string
    else
      string + " " + @next_node.generate_string
    end
  end
end
