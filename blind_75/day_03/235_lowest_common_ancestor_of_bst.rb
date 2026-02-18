# 235. Lowest Common Ancestor of a Binary Search Tree
# Link: https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/
# Difficulty: Medium

# Depth first search for each of the nodes and store the ancestors
# Then walk back through the ancestors and check if it exists in the other ancestors array
# @param {TreeNode} root
# @param {TreeNode} p
# @param {TreeNode} q
# @return {TreeNode}
def lowest_common_ancestor(root, p, q)
    p_ancestors = dig(root, p, [])
    q_ancestors = dig(root, q, [])
    p_ancestors.reverse.find do |x|
        q_ancestors.include?(x)
    end
end

def dig(node, target, ancestors)
    return if node.nil?
    return ancestors + [node] if node.val == target.val
    return dig(node.left, target, ancestors + [node]) || dig(node.right, target, ancestors + [node])
end

# Optimized version where the path comparison is O(n) instead of O(n^2) by checking where the paths diverge
# @param {TreeNode} root
# @param {TreeNode} p
# @param {TreeNode} q
# @return {TreeNode}
def lowest_common_ancestor_optimized(root, p, q)
    p_ancestors = dig(root, p, [])
    q_ancestors = dig(root, q, [])
    lca = nil
    p_ancestors.each_index do |i|
        break if p_ancestors[i]&.val != q_ancestors[i]&.val
        lca = p_ancestors[i]
    end
    lca
end

def dig(node, target, ancestors)
    return if node.nil?
    return ancestors + [node] if node.val == target.val
    return dig(node.left, target, ancestors + [node]) || dig(node.right, target, ancestors + [node])
end
