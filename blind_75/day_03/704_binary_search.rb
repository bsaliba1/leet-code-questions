# 704. Binary Search
# Link: https://leetcode.com/problems/binary-search/
# Difficulty: Easy

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
    find(nums, target, 0, nums.length - 1) 
end

def find(nums, target, start, last)
    pivot = (start + last)/2
    return pivot if nums[pivot] == target
    return -1 if start == last || start < 0 || last < 0
    if target > nums[pivot] 
        find(nums, target, pivot + 1, last)
    else
        find(nums, target, start, pivot - 1)
    end
end
