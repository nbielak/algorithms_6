require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
    queue = fill_queue(vertices)
    result = []
    
    i = 0
    while queue 
        vert = queue.pop
        vert.out_edges.map do |edge|
            queue.unshift(edge.to_vertex)
            edge.destroy! 
        end
        result << vert
        fill_queue(vertices) if queue.empty? && !(vertices.empty?)
    end

    return vertices.empty? ? [] : result
end

def fill_queue(arr)
    queue = []
    arr.each do |vertex|
        if vertex.in_edges.empty?
            queue.unshift(vertex)
            arr.delete(vertex)
        end
    end
    queue
end
