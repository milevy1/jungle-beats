require "./lib/node"
require "./lib/linked_list"

RSpec.describe 'Jungle Beats Linked List' do
  before :each do
    @list = LinkedList.new
  end

  it 'can be initialized' do
    expect(@list).to be_an_instance_of(LinkedList)
  end

  describe 'attributes' do
    describe '@head' do
      it 'starts as nil' do
        expect(@list.head).to be_nil
      end
    end
  end

  describe 'instance methods' do
    describe '#append' do
      it 'appends a new node to the head of an empty linked list' do
        @list.append("doop")

        expect(@list.head).to be_an_instance_of(Node)
        expect(@list.head.data).to eq("doop")
      end

      it 'returns the data argument given' do
        expect(@list.append("doop")).to eq("doop")
      end
    end

    describe '#count' do
      it 'tells us how many things are in the list' do
        expect(@list.count).to eq(0)

        @list.append("doop")

        expect(@list.count).to eq(1)
      end
    end

    describe '#to_string' do
      it 'generates a string of all the elements in the list, separated by spaces' do
        @list.append("doop")

        expect(@list.to_string).to eq("doop")
      end
    end
  end
end


# > list.to_string
# => "doop"
