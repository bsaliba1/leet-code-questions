# 7. Reverse Integer
# Link: https://leetcode.com/problems/reverse-integer/
# Given a 32-bit signed integer, reverse digits of an integer.

MIN_INT = -(2**31)
MAX_INT = (2**31)-1

class Solution:
    # Using String Slicing
    # Syntax: mystring[b_index:l_index:step]
    # If step < 0 then it reverses the slice

    @staticmethod
    def reverseInteger(x: int) -> int:
        size = len(str(x))
        rev_string = str(x)[::-1] if x >= 0 else '-'+str(x)[size:0:-1]
        rev_int = int(rev_string)
        return rev_int if MIN_INT < rev_int < MAX_INT else 0

    @staticmethod
    def reverseIntegerPP(x: int) -> int:
        if x < 0:
            return - Solution.helper(x)
        else:
            return Solution.helper(x)

    @staticmethod
    def helper(x: int) -> int:
        rev = 0
        temp = abs(x)
        while temp != 0:
            pop = temp % 10
            temp //= 10  # Note // divides and truncates
            if rev > float("inf")/10 or (rev == float("inf") and pop > 7):
                return 0
            if rev < -float("inf")/10 or (rev == -float("inf") and pop < -8):
                return 0
            rev = rev*10 + pop
        return rev


print("Solution1: ", end='')
print(Solution.reverseIntegerPP(-14))
print("Solution2: ", end='')
print(Solution.reverseInteger(-14))


