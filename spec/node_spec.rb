require "./lib/node"

RSpec.describe 'Jungle Beats Node' do
  before :each do
    @node = Node.new("plop")
  end

  it 'can be initialized with data' do
    expect(@node).to be_an_instance_of(Node)
  end

  describe 'attributes' do
    describe '@data' do
      it 'returns the data held by the node' do
        expect(@node.data).to eq("plop")
      end
    end

    describe '@next_node' do
      it 'returns nil if there is no next node' do
        expect(@node.next_node).to be_nil
      end
    end
  end

  describe 'instance methods' do
    describe '#add_node' do
      it 'adds a next_node if next_node is nil' do
        @node.add_node("deep")

        expect(@node.next_node.data).to eq("deep")
      end

      it 'adds a node to the end of the list if next_node is not nil' do
        @node.add_node("deep")
        @node.add_node("doop")

        expect(@node.next_node.next_node.data).to eq("doop")
      end
    end
  end
end
