# 49. Group Anagrams
# Link: https://leetcode.com/problems/group-anagrams/
# Difficulty: Medium

# Count the number of each letter that there is in each word then
# add that word to the anagram group using the letter count as the index
# Time complexity: O(sxc)
def group_anagrams(strs)
  anagram_groups = Hash.new { |h, k| h[k] = [] }
  strs.each do |s| # O(s) where n = number of strings
    letter_count = Array.new(26, 0)
    s.split('').each do |c| # O(c) where c = number of chars in string
      ordinal = c.ord % 26
      letter_count[ordinal] = letter_count[ordinal] + 1 # key lookup is O(26) for comparing fixed size arrays
    end
    anagram_groups[letter_count] << s
  end
  anagram_groups.values # O(k) where k is the number of anagram groups (k <= s)
end
