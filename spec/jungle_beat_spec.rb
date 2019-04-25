require "./lib/node"
require "./lib/linked_list"
require "./lib/jungle_beat"

RSpec.describe 'Jungle Beats class' do
  before :each do
    @jb = JungleBeat.new
  end

  it 'can be initialized' do
    expect(@jb).to be_an_instance_of(JungleBeat)
  end

  describe 'attributes' do
    it '@list' do
      expect(@jb.list).to be_an_instance_of(LinkedList)

      expect(@jb.list.head).to be_nil
    end
  end
end

# > jb.append("deep doo ditt")
# => "deep doo ditt"
# > jb.list.head.data
# => "deep"
# > jb.list.head.next_node.data
# => "doo"
# > jb.append("woo hoo shu")
# => "woo hoo shu"
# > jb.count
# 6
