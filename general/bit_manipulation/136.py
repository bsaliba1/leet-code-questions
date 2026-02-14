# 136. Single Number
# Link: https://leetcode.com/problems/single-number/
from typing import List
from functools import reduce


class Solution:
    def singleNumber(self, nums: List[int]) -> int:
        ref = {}
        for i in nums:
            if i not in ref:
                ref[i] = 0
            else:
                ref[i] += 1

        for k, v in ref.items():
            if not v:
                return k

    def singleNum(self, nums: List[int]) -> int:
        sol = 0
        for n in nums:
            sol ^= n

        return sol

    def singleNumOL(self, nums: List[int]) -> int:
        return reduce(lambda acc, i: acc^i, nums)

print(Solution().singleNumOL([2, 2, 1]))








