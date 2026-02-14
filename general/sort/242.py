# 242. Valid Anagram
# Link: https://leetcode.com/problems/valid-anagram/

from collections import defaultdict

class Solution:
    def isAnagram(self, s: str, t: str) -> bool:
        if len(s) != len(t):
            return False
        bit_map = [0]*26
        for i in range(0, len(s)):
            bit_map[ord(s[i]) % 26] += 1
            bit_map[ord(t[i]) % 26] -= 1
        return True if bit_map == [0]*26 else False

    def isAnagramSimple(self, s: str, t: str) -> bool:
        if len(s) != len(t):
            return False
        char_map = defaultdict(int)
        for i in range(0, len(s)):
            char_map[s[i]] += 1
            char_map[t[i]] -= 1
        return all(x == 0 for x in char_map.values())


print(Solution().isAnagram("abbc", "cbba"))
print(Solution().isAnagramSimple("abbc", "cbba"))
