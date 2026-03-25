def all_paths_source_target(graph)
  target = graph.length - 1
  result = []
  dfs(graph, 0, target, [0], result)
  result
end

def dfs(graph, node, target, path, result)
  if node == target
    result << path.dup
    return
  end

  graph[node].each do |neighbor|
    path << neighbor
    dfs(graph, neighbor, target, path, result)
    path.pop
  end
end
