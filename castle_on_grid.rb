# modified BFS for jumps
def modified_bfs(matrix, root_node, n)
  levels = Hash.new(Float::INFINITY)
  levels[root_node] = 0
  queue = []
  matrix[root_node] = 1
  queue.push root_node

  while queue.length > 0
    node = queue.shift

    get_adjacent_nodes(node, matrix, n).each do |next_node|
      if matrix[next_node] == 0
        levels[next_node] = levels[node] + 1
        matrix[next_node] = -1 # visited but not a wall
        queue.push next_node
      end
    end
  end

  levels
end

# building adjacency list dynamically
def get_adjacent_nodes(node, matrix, n)
  adj_nodes = []
  automata = [[0, 1], [1, 0], [0, -1], [-1, 0]]
  state = 0

  while state != 4
    i, j = automata[state]
    next_node = node

    while true
      next_node = [next_node[0] + i, next_node[1] + j]

      if matrix[next_node] == 1 || matrix[next_node] == nil
        state += 1
        break
      # if not a wall but visited we should skip it but continue going for further values
      elsif matrix[next_node] != -1
        adj_nodes.push [next_node[0], next_node[1]]
      end
    end
  end

  adj_nodes
end

# read input
n = gets.to_i
matrix = {}
n.times do |i|
  rows = gets.strip.split('').map {|c| c == '.' ? 0 : 1 }
  rows.each_with_index do |r, j|
    matrix[[i, j]] = r
  end
end

sy, sx, ey, ex = gets.strip.split.map(&:to_i)

root_node = [sy, sx]
levels = modified_bfs(matrix, root_node, n)

puts levels[[ey, ex]]
