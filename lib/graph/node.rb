# node.rb
#
# a class that represents a node in a graph

class Node

  def initialize(value)
    @value = value
    @incoming = []
    @outgoing = []
  end

end
