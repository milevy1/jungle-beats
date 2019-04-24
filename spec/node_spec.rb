require "./lib/node"

RSpec.describe 'Jungle Beats Node' do
  before :each do
    @node = Node.new("plop")
  end

  it 'can be initialized with data' do
    expect(@node).to be_an_instance_of(Node)
  end

  describe '#data' do
    it 'returns the data held by the node' do
      expect(@node.data).to eq("plop")
    end
  end

  describe '#next_node' do
    it 'returns nil if there is no next node' do
      expect(@node.next_node).to be_nil
    end
  end
end
