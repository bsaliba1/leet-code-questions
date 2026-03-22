# 19. Remove Nth Node From End of List
# Link: https://leetcode.com/problems/remove-nth-node-from-end-of-list/
# Difficulty: Medium

class Solution:
    def removeNthFromEnd(self, head: Optional[ListNode], n: int) -> Optional[ListNode]:
        nodes = []
        currentNode = head
        while currentNode != None:
            nodes.append(currentNode)
            currentNode = currentNode.next
        if n == len(nodes):
            return head.next
        else:
            nodes[len(nodes) - n - 1].next = nodes[len(nodes) - n].next
            return head
