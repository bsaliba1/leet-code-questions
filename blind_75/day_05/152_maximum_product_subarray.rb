# 152. Maximum Product Subarray
# Link: https://leetcode.com/problems/maximum-product-subarray/
# Difficulty: Medium

# Brute force
# For each index find all subarrays and get the max product
#
def max_product(nums)
  max_product = -Float::INFINITY
  nums.each_index do |i1|
    current_product = 1
    (i1...nums.length).each do |i2|
      current_product *= nums[i2]
      max_product = [max_product, current_product].max
    end
  end
  max_product
end

# Updated Kadane's algorithm
#
# @param {Integer[]} nums
# @return {Integer}
def max_product(nums)
  max_product = nums[0]
  current_min = nums[0]
  current_max = nums[0]
  nums[1..].each_with_index do |x, _i|
    min = [current_min * x, current_max * x, x].min
    max = [current_min * x, current_max * x, x].max
    current_min = min
    current_max = max
    max_product = [max_product, current_max].max
  end
  max_product
end
