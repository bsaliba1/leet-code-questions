# 21. Merge Two Sorted Lists
# Link: https://leetcode.com/problems/merge-two-sorted-lists/
# Difficulty: Easy


# Add both values from each list to an array and then sort the output array
# @param {ListNode} list1
# @param {ListNode} list2
# @return {ListNode}
def merge_two_lists(list1, list2)
    output = []
    while list1 != nil || list2 != nil
        output << list1.val if list1 != nil
        output << list2.val if list2 != nil
        list1 = list1.next if list1 != nil
        list2 = list2.next if list2 != nil
    end
    output.sort
end

# No sorting, pick the smallest value from one of the lists and add it to the output array and then step forward
# in whichever list had the smallest value
# @param {ListNode} list1
# @param {ListNode} list2
# @return {ListNode}
def merge_two_lists_optimized(list1, list2)
    output = []
    while list1 != nil || list2 != nil
        if list2.nil? || (list1 && list1.val <= list2.val)
            output << list1.val
            list1 = list1.next
        else
            output << list2.val
            list2 = list2.next
        end
    end
    output
end
