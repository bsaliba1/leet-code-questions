# 35. Search Insert Position
# Link: https://leetcode.com/problems/search-insert-position/


from typing import List


class Solution:
    def searchInsert(self, nums: List[int], target: int) -> int:
        return self.searchHelper(nums, target, 0, len(nums)-1)

    def searchHelper(self, nums: List[int], target: int, b: int, e: int) -> int:
        if b == e:
            return b + (nums[b] < target)

        mid = (e+b)//2
        if nums[mid] > target:
            return self.searchHelper(nums, target, b, mid)
        elif nums[mid] < target:
            return self.searchHelper(nums, target, mid+1, e)
        return mid

    def searchInsertTryExcept(self, nums: List[int], target: int) -> int:
        try:
            return nums.index(target)
        except:
            if nums[-1]<target:
                return len(nums)
            for i in range(len(nums)):
                if nums[i]>target:
                    return i


print(Solution().searchInsert([1, 3], 0))
