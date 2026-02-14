# 206. Reverse Linked List
# Link: https://leetcode.com/problems/reverse-linked-list/
# Task: Reverse a singly linked list.


class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None


def createList(arr=[1, 2, 3, 4, 5]) -> ListNode:
    if len(arr) == 0:
        return None
    head = ListNode(arr[0])
    temp = head
    for i in range(1, len(arr)):
        temp.next = ListNode(arr[i])
        temp = temp.next
    return head


def printList(head: ListNode):
    if head is None:
        print("[]", end=' ')
    while head is not None:
        print(head.val, end=' ')
        head = head.next
    print('')


class Solution:
    @staticmethod
    def reverseList(head: ListNode) -> ListNode:
        # Check that list is more than one element
        if head is None or head.next is None:
            return head

        double_next = head.next.next
        current = head.next
        prev = head
        prev.next = None
        while double_next is not None:
            current.next = prev
            prev = current
            current = double_next
            double_next = double_next.next
        current.next = prev
        return current


# Driver

print("Before: ")
ll = createList([])
printList(ll)

print("After: ")
rev_arr = Solution.reverseList(ll)
printList(rev_arr)
