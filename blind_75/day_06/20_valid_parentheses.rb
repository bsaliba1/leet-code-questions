# 20. Valid Parentheses
# Link: https://leetcode.com/problems/valid-parentheses/
# Difficulty: Easy

# Create a queue
# Add open parenthesis to queue
# When closed parenthesis pop last element from queue and check
# that it is the open parenthesis otherwise return false 
# @param {String} s
# @return {Boolean}
def is_valid(s)
    q = []
    s.each_char do |c|
        if ["(", "[", "{"].include?(c)
            q << c
        else
            return false if (c == ")" && q.last != "(") ||
                            (c == "}" && q.last != "{") ||
                            (c == "]" && q.last != "[")
            q.pop
        end
    end
    q.empty?
end
