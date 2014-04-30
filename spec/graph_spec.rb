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

    describe 'add' do

      it "should add a node to the graph with the given value" do
        graph1 = Graph::Graph.new('graph1')
        graph1.nodes.empty?.should eq(true)
        graph1.add(11)
        graph1.nodes.empty?.should eq(false)
        graph1.nodes[0].value.should eq(11)
      end

    end

    describe 'add_node' do

      it "should be able to add a single Node object to the graph" do
        graph1 = Graph::Graph.new('graph1')
        node1 = Graph::Node.new(5)
        graph1.nodes.empty?.should eq(true)
        graph1.add_node(node1)
        graph1.nodes.length.should eq(1)
        graph1.nodes.include?(node1).should eq(true)
      end

      it "should be able to add multiple Node objects to the graph" do
        graph1 = Graph::Graph.new('graph1')
        node1 = Graph::Node.new(2)
        node2 = Graph::Node.new(11)
        node3 = Graph::Node.new(5)
        graph1.nodes.empty?.should eq(true)
        graph1.add_node(node1)
        graph1.nodes.length.should eq(1)
        graph1.add_node(node2)
        graph1.nodes.length.should eq(2)
        graph1.nodes.include?(node1).should eq(true)
        graph1.nodes.include?(node2).should eq(true)
        graph1.nodes.include?(node3).should eq(false)
      end

    end

    describe 'add_nodes' do

      it "should be able to handle an empty array of nodes" do
        graph1 = Graph::Graph.new('graph1')
        graph1.nodes.empty?.should eq(true)
        graph1.add_nodes([])
        graph1.nodes.empty?.should eq(true)
      end

      it "should be able to add an array containing a single node" do
        graph1 = Graph::Graph.new('graph1')
        graph1.nodes.empty?.should eq(true)
        node1 = Graph::Node.new(2)
        graph1.add_nodes([node1])
        graph1.nodes.length.should eq(1)
      end

      it "should be able to add an array containing multiple nodes" do
        graph1 = Graph::Graph.new('graph1')
        graph1.nodes.empty?.should eq(true)
        node1 = Graph::Node.new(3)
        node2 = Graph::Node.new(4)
        node3 = Graph::Node.new(5)
        graph1.add_nodes([node3,node2,node1])
        graph1.nodes.length.should eq(3)
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
