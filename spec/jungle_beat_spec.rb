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

  describe 'instance methods' do
    describe '#append' do
      it 'appends space separated elements to the linked list' do
        @jb.append("deep doo ditt")

        expect(@jb.list.head.data).to eq("deep")
        expect(@jb.list.head.next_node.data).to eq("doo")

        expect(@jb.list.count).to eq(3)
      end
    end
  end
end


# > jb.append("woo hoo shu")
# => "woo hoo shu"
# > jb.count
# 6
