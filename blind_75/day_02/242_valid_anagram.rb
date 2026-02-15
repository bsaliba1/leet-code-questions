# 242. Valid Anagram
# Link: https://leetcode.com/problems/valid-anagram/
# Difficulty: Easy


# Count the number of each letter in s
# Decrement the count once for each letter in t
# If we were able to decrement all the way through t then return true
# @param {String} s
# @param {String} t
# @return {Boolean}
def is_anagram(s, t)
    return false if s.length != t.length

    h = Hash.new(0)
    s.each_char do |l|
        h[l] += 1
    end
    t.each_char do |l|
        return false if h[l] == 0
        h[l] -= 1
    end
    true
end
