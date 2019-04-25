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

  def generate_string(string = self.data, element_counter = nil)
    if @next_node.nil? || element_counter == 1
      string
    else
      element_counter -= 1 if element_counter
      string + " " + @next_node.generate_string(@next_node.data, element_counter)
    end
  end

  def find_nodes(position, element_count)
    if position == 0
      generate_string(self.data, element_count)
    else
      @next_node.find_nodes(position - 1, element_count)
    end
  end

  def includes?(value)
    if @data == value
      true
    elsif @next_node.nil?
      false
    else
      @next_node.includes?(value)
    end
  end

  def pop
    if @next_node.nil?
      @data = nil
    elsif @next_node.next_node.nil?
      next_node_data = @next_node.data
      @next_node = nil
      next_node_data
    else
      @next_node.pop
    end
  end
end
