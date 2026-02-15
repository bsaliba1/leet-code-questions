# 125. Valid Palindrome
# Link: https://leetcode.com/problems/valid-palindrome/
# Difficulty: Easy

# Remove alphanumerics with trim `tr` and downcase then reverse and check that it's equivalent
# @param {String} s
# @return {Boolean}
def is_palindrome(s)
    s = s.tr('^A-Za-z0-9', '').downcase
    s.reverse == s
end
