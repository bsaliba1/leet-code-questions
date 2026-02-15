# 1. Two Sum
# Link: https://leetcode.com/problems/two-sum/
# Difficulty: Easy

# Brute force solution where you traverse the array select a value and then traverse the rest of the
# array to find the the compliment 
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

# First, uses a hashmap to track the indexes of each value
# Second, iterates over the array to determine if the compliment exists for the given index
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum_optimized(nums, target)
    h = Hash.new{|h,k| h[k] = []}
    nums.each_with_index do |x, i|
        h[x] << i
    end
    nums.each_with_index do |x, i|
        compliment = target - x
        if x == compliment
            return [h[compliment][0], h[compliment][1]] if h[compliment].length > 1
        else
            return [h[compliment][0], i].sort if h[compliment].length > 0 
        end 
    end
    return []
end
