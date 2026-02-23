# 98. Validate Binary Search Tree
# Link: https://leetcode.com/problems/validate-binary-search-tree/
# Difficulty: Medium

# Notes: maintaining a conditional is simple with
# is_condition = true
# new_condition = is_condition && additional_condition

# Finds whether a BST is valid by checking if:
# - left node is less than root
# - right node is greater than root
# - left node subtree values are less than root (passed as max value)
# - right node subtree values are greater than root (passed as min value)
def is_valid_bst(root, min_val = -Float::INFINITY, max_val = Float::INFINITY)
  is_valid = true
  if root.left
    is_valid = is_valid &&
               root.left.val > min_val &&
               root.left.val < max_val &&
               root.left.val < root.val &&
               is_valid_bst(root.left, min_val, root.val)
  end
  if root.right
    is_valid = is_valid &&
               root.right.val > min_val &&
               root.right.val < max_val &&
               root.right.val > root.val &&
               is_valid_bst(root.right, root.val, max_val)
  end
  is_valid
end
