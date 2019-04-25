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
      it 'appends a single node to the head of an empty linked list' do
        @list.append("doop")

        expect(@list.head).to be_an_instance_of(Node)
        expect(@list.head.data).to eq("doop")
      end

      it 'returns the data argument given' do
        expect(@list.append("doop")).to eq("doop")
      end

      it 'appends next_nodes to each consective node' do
        @list.append("doop")
        @list.append("deep")

        expect(@list.head.next_node.data).to eq("deep")
      end

      it 'can append three nodes' do
        @list.append("doop")
        @list.append("deep")
        @list.append("daap")

        expect(@list.head.next_node.next_node.data).to eq("daap")
      end
    end

    describe '#prepend' do
      it 'adds nodes to the beginning of the list' do
        @list.append("plop")
        @list.append("suu")

        @list.prepend("dop")

        expect(@list.to_string).to eq("dop plop suu")
        expect(@list.head.data).to eq("dop")
        expect(@list.count).to eq(3)
      end
    end

    describe '#insert' do
      it 'will insert one or more elements at a given position in the list' do
        @list.append("plop")
        @list.append("suu")
        @list.prepend("dop")

        @list.insert(1, "woo")

        expect(@list.to_string).to eq("dop woo plop suu")
      end

      it 'can insert at beginning of list' do
        @list.append("plop")
        @list.append("suu")
        @list.prepend("dop")

        @list.insert(0, "woo")

        expect(@list.to_string).to eq("woo dop plop suu")
      end

      it 'can insert at end of list' do
        @list.append("plop")
        @list.append("suu")
        @list.prepend("dop")

        @list.insert(4, "woo")

        expect(@list.to_string).to eq("dop plop suu woo")
      end

      it 'can insert to negative position, assumes beginning of list' do
        @list.append("plop")
        @list.append("suu")
        @list.prepend("dop")

        @list.insert(-1, "woo")

        expect(@list.to_string).to eq("woo dop plop suu")
      end
    end

    describe '#count' do
      it 'tells us how many things are in the list' do
        expect(@list.count).to eq(0)

        @list.append("doop")

        expect(@list.count).to eq(1)

        @list.append("deep")

        expect(@list.count).to eq(2)

        @list.append("daap")

        expect(@list.count).to eq(3)
      end
    end

    describe '#to_string' do
      it 'returns nil if head is nil' do
        expect(@list.to_string).to be_nil
      end

      it 'generates a string of all the elements in the list, separated by spaces' do
        @list.append("doop")

        expect(@list.to_string).to eq("doop")

        @list.append("deep")

        expect(@list.to_string).to eq("doop deep")

        @list.append("daap")

        expect(@list.to_string).to eq("doop deep daap")
      end
    end

    describe '#find' do
      it 'takes two parameters, the first indicates the first position to return and the second parameter specifies how many elements to return' do
        @list.append("deep")
        @list.append("woo")
        @list.append("shi")
        @list.append("shu")
        @list.append("blop")

        expect(@list.find(2, 1)).to eq("shi")
        expect(@list.find(1, 3)).to eq("woo shi shu")
      end
    end

    describe '#includes?' do
      it 'gives back true or false whether the supplied value is in the list' do
        @list.append("deep")
        @list.append("woo")
        @list.append("shi")

        expect(@list.includes?("deep")).to be_truthy
        expect(@list.includes?("woo")).to be_truthy
        expect(@list.includes?("shi")).to be_truthy

        expect(@list.includes?("matt")).to be_falsy
      end
    end

    describe '#pop' do
      it 'removes the last element from the list' do
        @list.append("deep")
        @list.append("woo")
        @list.append("blop")

        expect(@list.to_string).to eq("deep woo blop")

        @list.pop

        expect(@list.to_string).to eq("deep woo")

        @list.pop

        expect(@list.to_string).to eq("deep")

        @list.pop

        expect(@list.to_string).to be_nil
      end
    end
  end
end
