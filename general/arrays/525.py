# 525. Contiguous Arrays
# Link: https://leetcode.com/problems/contiguous-array/
from typing import List


# Brute Force
class Solution:
    def findMaxLength(self, nums: List[int]) -> int:
        n = len(nums)
        answer = 0
        alt_list = list(map(lambda x: -1 if x == 0 else 1, nums))
        for i in range(n):
            temp = []
            sum = 0
            for j in range(n-i):
                el = alt_list[i+j]
                temp.append(el)
                sum += el
                if sum == 0 and len(temp) > answer:
                    answer = len(temp)
        return answer


# Dynamic
class Solution:
    def findMaxLength(self, nums: List[int]) -> int:
        first_occ = {}
        first_occ[0] = 0
        answer = 0
        pref = 0
        n = len(nums)
        for i in range(n):
            pref += -1 if nums[i] == 0 else 1
            if pref in first_occ:
                answer = max(answer, i+1 - first_occ[pref])
            else:
                first_occ[pref] = i+1
        return answer
