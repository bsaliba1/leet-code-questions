# 1. Two Sum
# Link: https://leetcode.com/problems/two-sum/
# Difficulty: Easy

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
    nums.each_with_index do |x, i1|
      nums[i1+1..].each_with_index do |y, i2|
        return [i1,i1+i2+1] if x + y == target
      end
    end
end

