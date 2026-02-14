# 942. DI String Match
# Link: https://leetcode.com/problems/di-string-match/

from typing import List


class Solution:
    def diStringMatch(self, s: str) -> List[int]:
        n = len(s)
        list = [0]*(n+1)
        top = n
        bottom = 0
        for i in range(n):
            if s[i] == 'I':
                list[i] = bottom
                bottom = bottom + 1
            else:
                list[i] = top
                top = top - 1
        list[n] = bottom
        return list


sol = Solution()
print(sol.diStringMatch("IDID"))



