# 100. Same Tree
# Link: https://leetcode.com/problems/same-tree/
# Link to Explanation: https://leetcode.com/problems/same-tree/discuss/457825/Python3-Solution-(PreOrder)-w-Explanation


class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None


class Solution:
    @staticmethod
    def isSameTree(x: TreeNode, y: TreeNode) -> bool:
        if x and y:
            return x.val == y.val and Solution().isSameTree(x.left, y.left) and Solution().isSameTree(x.right, y.right)
        return x == y
