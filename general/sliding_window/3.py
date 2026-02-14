# 3. Longest Substring Without Repeating Characters
# Link: https://leetcode.com/problems/longest-substring-without-repeating-characters/

import sys


class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        start, max_count, used_chars = 0, 0, {}
        for i in range(len(s)):
            c = s[i]
            if c in used_chars and start <= used_chars[c]:
                start = used_chars[c] + 1
            else:
                maxLength = max(maxLength, i - start + 1)
            used_chars[c] = i
        return max_count



print(Solution().lengthOfLongestSubstring(sys.argv[1]))
