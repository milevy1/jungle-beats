class Node
  attr_reader :data, :next_node

  def initialize(data)
    @data = data
    @next_node = nil
  end

  def add_node(data)
    if @next_node.nil?
      @next_node = Node.new(data)
    else
      @next_node.add_node(data)
    end
  end

  def count_nodes(counter = 1)
    if @next_node.nil?
      counter
    else
      @next_node.count_nodes(counter + 1)
    end
  end
end
