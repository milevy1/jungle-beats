class JungleBeat
  attr_reader :list

  def initialize
    @list = LinkedList.new
  end

  def append(space_separated_data)
    space_separated_data.split.each { |data| list.append(data) }
  end

  def count
    list.count
  end
end
