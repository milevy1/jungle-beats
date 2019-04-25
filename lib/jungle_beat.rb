class JungleBeat
  attr_reader :list

  def initialize
    @list = LinkedList.new
  end

  def append(space_separated_data)
    space_separated_data.split.each { |data| list.append(data) }
    space_separated_data
  end

  def count
    list.count
  end

  def play
    beats = list.to_string
    `say -r 500 #{beats}`
  end
end
