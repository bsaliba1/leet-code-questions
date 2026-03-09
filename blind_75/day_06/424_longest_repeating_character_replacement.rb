# 424. Longest Repeating Character Replacement
# Link: https://leetcode.com/problems/longest-repeating-character-replacement/
# Difficulty: Medium

# Sliding window O(n)
# If number of "other" values is <= k
#   expand right (end += 1)
# otherwise 
#   shift right (start += 1 AND end += 1)
# answer is the final size of the window
# @param {String} s
# @param {Integer} k
# @return {Integer}
def character_replacement(s, k)
    h = Hash.new { |h, k| h[k] = 0 }
    h[s[0]] = 1
    most_common_letter = s[0]
    start_i = 0
    end_i = 1
    while end_i < s.length
        next_letter = s[end_i]
        h[next_letter] += 1
        window_size = end_i - start_i + 1
        if h[next_letter] > h[most_common_letter]
            most_common_letter = next_letter
        end
        if window_size - h[most_common_letter] > k
            first_letter = s[start_i]
            h[first_letter] -= 1
            start_i += 1
        end
        end_i += 1
    end
    end_i - start_i
end
