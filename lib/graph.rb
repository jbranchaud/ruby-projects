require 'graph/graph.rb'

g1 = Graph::Graph.new('g1')
p g1

g1.nodes.push(Graph::Node.new(5))
p g1
