# 141. Linked List Cycle
# Link: https://leetcode.com/problems/linked-list-cycle/
# Difficulty: Easy


# Simple list traversal with keeping track of past values that have been visited
# @param {ListNode} head
# @return {Boolean}
def hasCycle_object_ids(head)
    visited = Hash.new(false)
    while head != nil
        return true if visited[head.object_id]
        visited[head.object_id] = true
        head = head.next
    end
    false
end

# Doesn't work! Bitmap solution
# @param {ListNode} head
# @return {Boolean}
def hasCycle_bitmap(head)
    bitmap = 0
    while head != nil
        return true if (bitmap & (1 << head.val)) != 0
        bitmap |= (1 << head.val)
        head = head.next
    end
    false
end

# Tortoise and hare solution. One pointer moves twice as fast as the other
# If they end up on the same node then its a cycle
# @param {ListNode} head
# @return {Boolean}
def hasCycle(head)
    slow = head
    fast = head
    while fast != nil && fast.next != nil && fast.next.next != nil
        slow = slow.next
        fast = fast.next.next
        return true if slow.object_id == fast.object_id
    end
    false
end
