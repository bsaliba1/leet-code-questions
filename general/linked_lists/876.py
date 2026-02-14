# 876. Middle of the Linked List
# Link: https://leetcode.com/problems/middle-of-the-linked-list/


# Definition for singly-linked list.
class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None


class Solution:
    def middleNode(self, head: ListNode) -> ListNode:
        middle = head
        while head:  # If head is not None
            head = head.next
            if head:
                middle = middle.next
                if head.next:
                    head = head.next
        return middle
