# 128. Longest Consecutive Sequence
# Link: https://leetcode.com/problems/longest-consecutive-sequence/
# Difficulty: Medium

# Save values in map for O(1) lookup
# Sort keys in map then check if next value exists incrementing the count and checking if it exceeds the max
# If it doesn't exist then reset current count
# @param {Integer[]} nums
# @return {Integer}
def longest_consecutive(nums)
  return 0 if nums.empty?

  h = Hash.new(false)
  nums.each do |n|
    h[n] = true
  end

  max_count = 1
  current_count = 1
  h.keys.sort.each do |k|
    if h[k + 1]
      current_count += 1
      max_count = [current_count, max_count].max
    else
      current_count = 1
    end
  end
  max_count
end

# Sort the values, then iterate through and check if the next index is greater than the last
# If so then increment count and update the max if current count is greater
# Otherwise reset the count
# @param {Integer[]} nums
# @return {Integer}
def longest_consecutive_no_map(nums)
  return 0 if nums.empty?

  nums.sort!
  max_count = 1
  current_count = 1
  nums.each_with_index do |n, i|
    if i - 1 >= 0 && nums[i - 1] == n - 1
      current_count += 1
      max_count = [current_count, max_count].max
    elsif i - 1 >= 0 && nums[i - 1] == n
      next
    else
      current_count = 1
    end
  end
  max_count
end

# Use a set for O(1) lookups
# Find the start of each sequence
# Then for each sequence lookup all subsequent values in the set
# If the number of subequent values is greater than max then update it
def longest_consecutive_optimal(nums)
  return 0 if nums.empty?

  set = nums.to_set
  max_count = 1

  sequence_starts = set.reject do |n|
    set.include?(n - 1)
  end

  sequence_starts.each do |n|
    current_count = 1
    current_val = n
    while set.include?(current_val + 1)
      current_count += 1
      current_val += 1
    end
    max_count = [current_count, max_count].max
  end
  max_count
end
