require 'spec_helper'

describe Graph do

  describe 'new' do

    it "should create a new graph with a name and no nodes" do
      graph1 = Graph::Graph.new('graph1')
      graph1.name.should eq('graph1')
      graph1.nodes.empty?.should eq(true)
    end

  end

end
