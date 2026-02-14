# 1. Two Sum
# Link: https://leetcode.com/problems/two-sum/

from typing import List


class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        sol = [0, 0]
        my_map = dict()
        for x in range(len(nums)):
            compliment = target - nums[x]
            if compliment in my_map:
                sol[0] = x
                sol[1] = my_map[compliment]
                return sol
            my_map[nums[x]] = x


sol = Solution()
print(sol.twoSum([1,3,4,2], 6))

