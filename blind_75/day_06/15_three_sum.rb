# 15. 3Sum
# Link: https://leetcode.com/problems/3sum/
# Difficulty: Medium

# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
    valid_triplets = Set.new
    number_indexes = Hash.new { |h,k| h[k] = [] }
    nums.each_with_index do |n, i|
      number_indexes[n] << i
    end
    nums.each_with_index do |n1, i|
        nums.each_with_index do |n2, j|
          next if j <= i
          n3 = -(n1+n2)
          if number_indexes[n3].any? { |n| n != i && n !=j }
            valid_triplets << [n1, n2, n3].sort
          end
        end
    end
    valid_triplets.to_a
end

# Uses two pointer for two sum to make the solution faster, due to the fact that the array is
# already sorted so there's no need to create a hash of number indexes for every two sum check
def three_sum_optimal(nums)
    nums.sort!
    triplets = Set.new
    nums.each_with_index do |n, i|
        sub = nums[i+1..]
        valid_pairs = two_sum(sub, -n)
        valid_pairs.each do |pair|
            triplets << [n, sub[pair[0]], sub[pair[1]]].sort if !pair.empty?
        end
    end
    triplets.to_a
end

# checks two pointers if start and end values are equal to target, then increment the start by 1
# if the sum is less than the target, otherwise decrement the end value by 1
def two_sum(nums, target)
    return [] if nums.empty?
    start_i = 0
    end_i = nums.length - 1
    valid_pairs = []
    while start_i < end_i
        n1 = nums[start_i]
        n2 = nums[end_i]
        if n1 + n2 == target
            valid_pairs << [start_i, end_i] 
            start_i += 1 while start_i < end_i && nums[start_i] == nums[start_i + 1]
            end_i -= 1 while start_i < end_i && nums[end_i] == nums[end_i - 1]
            start_i += 1
            end_i -= 1
        elsif n1 + n2 < target
            start_i += 1 while start_i < end_i && nums[start_i] == nums[start_i + 1]
            start_i += 1
        else
            end_i -= 1 while start_i < end_i && nums[end_i] == nums[end_i - 1]
            end_i -= 1
        end
    end
    valid_pairs
end

