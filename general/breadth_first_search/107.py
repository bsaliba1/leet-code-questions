# 107. Binary Tree Level Order Traversal II
# Link: https://leetcode.com/problems/binary-tree-level-order-traversal-ii/

# Definition for a binary tree node.

from typing import List


class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None


class Solution:
    def levelOrderBottom(self, root: TreeNode) -> List[List[int]]:
        level_mapping = []
        self.BFS(root, level_mapping, 1)
        return reversed(level_mapping)

    def BFS(self, root: TreeNode, level_mapping: int, level_count:int):
        if root:
            if len(level_mapping) < level_count: level_mapping.append([])
            self.BFS(root.left, level_mapping, level_count+1)
            self.BFS(root.right, level_mapping, level_count+1)
            level_mapping[level_count-1].append(root.val)






