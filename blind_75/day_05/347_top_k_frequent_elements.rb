# 347. Top K Frequent Elements
# Link: https://leetcode.com/problems/top-k-frequent-elements/
# Difficulty: Medium

# Optimal
# Get the count
# Bucket sort based on the count
# Get the values in the buckets until the result is value k
#
# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def top_k_frequent_optimal(nums, k)
  frequency = Hash.new(0)
  nums.each do |n|
    frequency[n] += 1
  end

  buckets = Array.new(nums.length + 1) { [] }
  frequency.each do |num, count|
    buckets[count] << num
  end

  result = []
  buckets.reverse.each do |bucket|
    bucket.each do |num|
      result << num
      return result if result.length == k
    end
  end
end

# Suboptimal O(nlogn)
# Get the counts then reverse sort and take the slice up to 'k'
def top_k_frequent(nums, k)
  h = Hash.new(0)
  nums.each do |n|
    h[n] += 1
  end

  order = h.sort_by do |_k, v|
    -v
  end

  order[0..k - 1].map(&:first)
end
