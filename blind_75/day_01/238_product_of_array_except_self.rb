# 238. Product of Array Except Self
# Link: https://leetcode.com/problems/product-of-array-except-self/
# Difficulty: Medium

# @param {Integer[]} nums
# @return {Integer[]}
def product_except_self(nums)
    prefix = [1]
    postfix = [1]
    nums[0..nums.length-2].each_index do |i|
        prefix << (prefix[i] * nums[i])
        postfix.prepend(postfix[0] * nums[-(i+1)])
    end
    postfix.map.with_index do |_, i|
        prefix[i] * postfix[i]
    end
end
