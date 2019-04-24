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
      1
    end
  end

  def to_string
    @head.data
  end
end
