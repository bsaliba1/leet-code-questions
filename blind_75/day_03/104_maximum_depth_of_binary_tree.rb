# 104. Maximum Depth of Binary Tree
# Link: https://leetcode.com/problems/maximum-depth-of-binary-tree/
# Difficulty: Easy

# DFS version
# @param {TreeNode} root
# @return {Integer}
def max_depth(root)
    dig(root, 0)
end

def dig(node, depth)
    return depth if node.nil?
    left_depth = dig(node.left, depth +1)
    right_depth = dig(node.right, depth +1)
    [left_depth, right_depth].max
end

# BFS version
def max_depth(root)
  return 0 if root.nil?
  queue = [root]
  depth = 0
  while !queue.empty?
    depth += 1
    queue.length.times do
      node = queue.shift
      queue << node.left if node.left
      queue << node.right if node.right
    end
  end
  depth
end
