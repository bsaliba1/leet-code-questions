# 844. Backspace String Compare
# Link: https://leetcode.com/problems/backspace-string-compare/


class Solution:
    def backspaceCompare(self, S: str, T: str) -> bool:

        def step(s, i):
            count = 0
            i += 1
            while i < len(s):
                count += [-1, 1][s[i] is '#']
                if count < 0:
                    break
                i += 1
            return i

        revS = S[::-1]
        revT = T[::-1]
        iterS = step(revS, -1)
        iterT = step(revT, -1)

        while iterS < len(revS) and iterT < len(revT) and revS[iterS] == revT[iterT]:
            iterS = step(revS, iterS)
            iterT = step(revT, iterT)
        return iterS >= len(revS) and iterT >= len(revT)

