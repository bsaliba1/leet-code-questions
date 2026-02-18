# 226. Invert Binary Tree
# Link: https://leetcode.com/problems/invert-binary-tree/
# Difficulty: Easy

# @param {TreeNode} root
# @return {TreeNode}
def invert_tree(root)
    return [] if root == nil
    queue = [root]
    while !queue.empty?
        node = queue.pop
        queue << node.left if node.left != nil
        queue << node.right if node.right != nil
        left = node.left
        node.left = node.right
        node.right = left
    end
    root
end
