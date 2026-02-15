# 3. Longest Substring Without Repeating Characters
# Link: https://leetcode.com/problems/longest-substring-without-repeating-characters/
# Difficulty: Medium

# Add to the current substring as long as there are no duplicates
# If there are then get all of the characters after the prior duplicated character
# If the current substring is longer than the longest substring then set the new longest substring
# to the current substring
#
# Example:
#   
#   s: d v d f
#
#  Step 1: l = "d" | current = "d" | longest = "d" 
#  Step 2: l = "v" | current = "dv" | longest = "dv" 
#  Step 3: l = "d" | current = "vd" | longest = "dv" -- new current substring is the substring following the duplicate character of the current substring  -- current_substring[current_substring.index(l) + 1..]
#  Step 4: l = "f" | current = "vdf" | longest = "vdf"
#
#  length = 3
#
# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
    current_substring = ""
    longest_substring = ""
    index = 0
    while index != s.length
        l = s[index]
        if current_substring.include?(l)
            current_substring = current_substring[current_substring.index(l) + 1..] + l
        else
            current_substring << l
            longest_substring = [longest_substring, current_substring].max_by(&:length)
        end
        index += 1
    end
    longest_substring.length
end
