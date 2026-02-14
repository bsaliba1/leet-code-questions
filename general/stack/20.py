# 20. Valid Parentheses
# Link: https://leetcode.com/problems/valid-parentheses/

import sys


class Solution:
    def isValid(self, s: str) -> bool:
        opened = ['[', '(', '{']
        closed = [']', ')', '}']
        stack = []
        for c in s:
            if c in opened:
                stack.append(c)
            else:
                if len(stack) != 0 and stack[-1] == opened[closed.index(c)]:
                    stack.pop()
                else:
                    return False
        return True if len(stack) == 0 else False

    def isValidConstMem(self, s):
        while '[]' in s or '()' in s or '{}' in s:
            s = s.replace('[]','').replace('()','').replace('{}','')
        return not len(s)


print(Solution().isValid(sys.argv[1]))
