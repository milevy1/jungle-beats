class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(data)
    if @head.nil?
      @head = Node.new(data)
    else
      @head.add_node(data)
    end
    data
  end

  def count
    if @head.nil?
      0
    else
      @head.count_nodes
    end
  end

  def to_string
    if @head.nil?
      nil
    else
      @head.generate_string
    end
  end
end
