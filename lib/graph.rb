class Vertex
  attr_accessor :in_edges, :out_edges
  attr_reader :value

  def initialize(value)
    @value = value
    @in_edges = []
    @out_edges = []
  end
end

class Edge
  attr_accessor :from_vertex, :to_vertex
  attr_reader :cost

  def initialize(from_vertex, to_vertex, cost = 1)
    @from_vertex = from_vertex
    @to_vertex = to_vertex
    @cost = cost

    add_to_vertices
  end

  def destroy!
    from_vertex.out_edges.delete(self)
    to_vertex.in_edges.delete(self)
    @from_vertex = nil
    @to_vertex = nil
  end

  private

  def add_to_vertices
    @from_vertex.out_edges << self
    @to_vertex.in_edges << self
  end
end
