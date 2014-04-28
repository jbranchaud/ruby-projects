require 'spec_helper'

describe Graph do

  describe 'Graph' do

    describe 'new' do

      it "should create a new graph with a name and no nodes" do
        graph1 = Graph::Graph.new('graph1')
        graph1.name.should eq('graph1')
        graph1.nodes.empty?.should eq(true)
      end

    end

  end

  describe 'Node' do

    describe 'new' do

      it "should create a new node with the given value and no incoming or outgoing nodes" do
        node1 = Graph::Node.new(11)
        node1.value.should eq(11)
        node1.incoming.empty?.should eq(true)
        node1.outgoing.empty?.should eq(true)
      end

    end

  end

end
