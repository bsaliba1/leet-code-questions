# 217. Contains Duplicate
# Link: https://leetcode.com/problems/contains-duplicate/
# Difficulty: Easy

# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)
    value_count = Hash.new{ |h, k| h[k] = 0 }
    nums.each do |x|
        value_count[x] += 1
        return true if value_count[x] > 1
    end
    return false   
end

def contains_duplicate_simplest(nums)
    Set.new(nums).length < nums.length
end
