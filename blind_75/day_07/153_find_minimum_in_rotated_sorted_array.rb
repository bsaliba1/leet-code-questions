# 153. Find Minimum in Rotated Sorted Array
# Link: https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/
# Difficulty: Medium

# Verbose version of doing the same thing in solution 2
class Solution1:
    def findMin(self, nums: List[int]) -> int:
        return self.binarySearchMin(nums, 0, len(nums) - 1)
    def binarySearchMin(self, nums: List[int], start: int, end: int):
        if nums[start] <= nums[end]:
            return nums[start]
        if start + 1 == end:
            return min(nums[start], nums[start + 1])
        mid = (start + end) // 2
        if(nums[mid] > nums[start]):
            return self.binarySearchMin(nums, mid, end)
        else:
            return self.binarySearchMin(nums, start, mid)

# Optimal solution
# Continually checks the mid-point and if the mid-point is less than the end
# then check the first half
# Otherwise, check the second half
class Solution2:
    def findMin(self, nums: List[int]) -> int:
        low, high = 0, len(nums) - 1
        while low < high:
            mid = (high + low) // 2
            if nums[mid] < nums[high]:
                high = mid
            else:
                low = mid + 1
        return nums[low]


