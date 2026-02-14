# 101. Symmetric Tree
# Link: https://leetcode.com/problems/symmetric-tree/

# Definition for a binary tree node.
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None

class Solution:
    @staticmethod
    def isSymmetric(root: TreeNode) -> bool:
        if root is None:
            return True

        return Solution().checkSubTree(root.left, root.right)

    @staticmethod
    def checkSubTree(first: TreeNode, second: TreeNode):
        if first and second:
            return first.val == second.val and Solution().checkSubTree(first.left, second.right) and Solution().checkSubTree(first.right, second.left)
        return first == second
