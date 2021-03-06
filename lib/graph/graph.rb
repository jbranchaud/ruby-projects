# graph module
module Graph

  # graph.rb
  #
  # a class that represents a graph
  class Graph
  
    attr_accessor :name, :nodes
    def initialize(name)
      @name = name
      @nodes = [] # empty list of nodes
    end

    # add a node to the graph with the given value
    def add(value)
      @nodes << Node.new(value)
    end

    # add the given node to the graph
    def add_node(node)
      @nodes << node
    end

    # add the array of nodes to the graph
    def add_nodes(node_array)
      @nodes += node_array
    end

    # remove the given node from the graph
    def remove_node(node)
      @nodes.delete(node)
      # the edges are going to have to be handled too
      # that might look like iterating over all the nodes in the @incoming
      # and @outgoing lists of the given node and for each of those nodes,
      # the the references to this node will need to be removed.
      # node.outgoing.each { |out|
      #   out.outgoing.delete(node)
      #   out.incoming.delete(node)
      # }
    end

    # remove the given nodes from the graph
    def remove_nodes(node_array)
      node_array.each { |node| @nodes.delete(node) }
    end

    # connect the first node to the second node (directionality)
    # the second node will be added to the outgoing list of the first node
    # and the first node will be added to the incoming list of the second
    # node.
    def connect_to(node1,node2)
      # assuming node1 and node2 are part of this graph
      node1.outgoing << node2
      node2.incoming << node1
    end
  
  end
  
  
  # node
  #
  # a class that represents a node in a graph
  class Node
  
    attr_accessor :value, :incoming, :outgoing
    def initialize(value)
      @value = value
      @incoming = []
      @outgoing = []
    end
  
  end

end
