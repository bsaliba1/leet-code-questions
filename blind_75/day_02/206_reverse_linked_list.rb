# 206. Reverse Linked List
# Link: https://leetcode.com/problems/reverse-linked-list/
# Difficulty: Easy

# Traverse the list and save the values as you go by adding values to the front of the array
## @param {ListNode} head
# @return {ListNode}
def reverse_list(head)
    output = []
    while head != nil
        output.unshift(head.val)
        head = head.next
    end
    output
end

# Traverse the list recursively and save values as you go
# @param {ListNode} head
# @return {ListNode}
def reverse_list(head)
    output = []
    traverse_list(head, output)
end

def traverse_list(head, output)
    return output if head == nil
    output.unshift(head.val)
    traverse_list(head.next, output)
end
