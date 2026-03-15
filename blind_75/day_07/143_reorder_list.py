# 143. Reorder List
# Link: https://leetcode.com/problems/reorder-list/
# Difficulty: Medium

# Create an array so as to be able to doubly link
# Have two pointers and combine front and back simultaneously
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def reorderList(self, head: Optional[ListNode]) -> None:
        arr = []
        currentNode = head
        while(currentNode != None):
            arr.append(currentNode)
            currentNode = currentNode.next
        first_i = 0
        last_i = len(arr) - 1
        while(first_i < last_i):
            arr[first_i].next = arr[last_i]
            arr[first_i].next.next = arr[first_i + 1]
            arr[first_i].next.next.next = None
            first_i += 1
            last_i -= 1
        head
