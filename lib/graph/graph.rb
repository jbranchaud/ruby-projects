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

    def add(value)
      @nodes << Node.new(value)
    end

    def add_node(node)
      @nodes << node
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
