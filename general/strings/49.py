# 49. Group Anagrams
# Link: https://leetcode.com/problems/group-anagrams/

from typing import List


class Solution:
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        word_map = dict()
        for word in strs:
            # List number of times each letter occurs in this word
            num_letters = [0] * 26  # Bit vector
            for c in word:
                num_letters[ord(c) - ord('a')] += 1  # ord gets ascii value of char

            num_letters = tuple(num_letters)  # List is unhashable so must turn list into tuple

            # If word_map doesn't have list for that anagram make one
            if word_map.get(num_letters, None) is None:
                word_map[num_letters] = []

            # Append word to it's anagram list
            word_map[num_letters].append(word)

        return list(word_map.values())


print(Solution().groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"]))
