# 9. Palindrome Number
# https://leetcode.com/problems/palindrome-number/


class Solution:
    def isPalindrome(self, x: int) -> bool:
        int_stringified = str(x)
        rev_string = int_stringified[::-1]
        return rev_string == int_stringified
