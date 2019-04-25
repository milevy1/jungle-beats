class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(data)
    if @head.nil?
      @head = Node.new(data)
    else
      @head.append_node(data)
    end
    data
  end

  def prepend(data)
    if @head.nil?
      append(data)
    else
      existing_list = @head
      @head = Node.new(data)
      @head.next_node = existing_list
    end
  end

  def insert(position, data)
    if position >= self.count    # Append if position is list length
      append(data)
    else
      @head.insert_node(position, data)
    end
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
