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
    describe '#append_node' do
      it 'adds a next_node if next_node is nil' do
        @node.append_node("deep")

        expect(@node.next_node.data).to eq("deep")
      end

      it 'adds a node to the end of the list if next_node is not nil' do
        @node.append_node("deep")
        @node.append_node("doop")

        expect(@node.next_node.next_node.data).to eq("doop")
      end
    end

    describe '#insert_node' do
      it 'will insert one or more elements at a given position in the list' do
        @node.append_node("suu")

        @node.insert_node(1, "woo")

        expect(@node.generate_string).to eq("plop woo suu")
      end
    end

    describe '#count_nodes' do
      it 'returns the count of nodes from this node to the tail' do
        expect(@node.count_nodes).to eq(1)

        @node.append_node("deep")

        expect(@node.count_nodes).to eq(2)

        @node.append_node("doop")

        expect(@node.count_nodes).to eq(3)
      end
    end

    describe '#generate_string' do
      it 'returns a space separated string of this node data plus all next nodes' do
        expect(@node.generate_string).to eq("plop")

        @node.append_node("deep")

        expect(@node.generate_string).to eq("plop deep")

        @node.append_node("doop")

        expect(@node.generate_string).to eq("plop deep doop")
      end

      it 'takes optional 2nd argument to count how far to return data' do
        @node.append_node("deep")
        @node.append_node("doop")

        expect(@node.generate_string(@node.data, 2)).to eq("plop deep")
      end
    end

    describe '#find_nodes' do
      it 'takes two parameters, the first indicates the first position to return and the second parameter specifies how many elements to return' do
        @node.append_node("woo")
        @node.append_node("shi")
        @node.append_node("shu")
        @node.append_node("blop")

        expect(@node.find_nodes(2, 1)).to eq("shi")
        expect(@node.find_nodes(1, 3)).to eq("woo shi shu")
      end
    end
  end
end
