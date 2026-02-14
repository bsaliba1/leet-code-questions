# 26. Remove Duplicates from Sorted Array
# Link: https://leetcode.com/problems/remove-duplicates-from-sorted-array/

from typing import List


class Solution:

    # Note this function must remove the elements in place
    @staticmethod
    def removeDuplicates(nums: List[int]) -> int:
        # Check if empty
        if len(nums) == 0:
            return 0

        previous_index = nums[0]
        index = 1
        while index < len(nums):
            if nums[index] == previous_index:
                nums.pop(index)
                index -= 1
            else:
                previous_index = nums[index]
            index += 1

        print(nums)
        return len(nums)


# Driver
print(Solution().removeDuplicates([0,0]))



