# 102. Binary Tree Level Order Traversal
# Link: https://leetcode.com/problems/binary-tree-level-order-traversal/
# Difficulty: Medium

# BFS but also keep track of all the node values at a given depth and append whenever a new node is visited
def level_order(root)
  return [] if root.nil?

  level_order = []
  queue = [root]
  depth = -1
  until queue.empty?
    depth += 1
    level_order << []
    queue.length.times do
      node = queue.shift
      level_order[depth] << node.val
      queue << node.left if node.left
      queue << node.right if node.right
    end
  end
  level_order
end
