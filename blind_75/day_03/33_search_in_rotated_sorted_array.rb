# 33. Search in Rotated Sorted Array
# Link: https://leetcode.com/problems/search-in-rotated-sorted-array/
# Difficulty: Medium

# Find the pivot (rotation point), unpivot the array, binary search for the target,
# then map the index back to the original array using modular arithmetic.
# @param {Integer[]} nums - ascending
# @param {Integer} target
# @return {Integer}
def search(nums, target)
  if nums.length > 1
    pivot = find_pivot(nums, 0, nums.length - 1)
    unpivoted_nums = nums[pivot + 1..] + nums[0..pivot]
    t = if pivot >= 0
          find_target(unpivoted_nums, target, 0, nums.length - 1)
        else
          find_target(nums, target, 0, nums.length - 1)
        end
    return -1 if t < 0

    # Map index from unpivoted back to pivoted: unpivoting shifted elements left by (pivot + 1), so reverse the shift
    (t + pivot + 1) % nums.length
  else
    find_target(nums, target, 0, nums.length - 1)
  end
end

# Find pivot by checking the first and last element in the range and seeing if the nums[start] > nums[end]
# if true check the left slice then the right slice
# if false return -1
def find_pivot(nums, s, e)
  return -1 if nums[s] < nums[e]
  return -1 if s == e
  return s if nums[s] > nums[e] && e - s == 1

  left = find_pivot(nums, s, s + ((e - s) / 2))
  return left if left >= 0

  right = find_pivot(nums, s + ((e - s) / 2) + 1, e)
  return right if right >= 0

  s + (e - s) / 2
end

# Binary search
def find_target(nums, target, s, e)
  middle = (e + s) / 2
  return middle if nums[middle] == target
  return -1 if s == e

  if nums[middle] > target
    find_target(nums, target, s, middle)
  else
    find_target(nums, target, middle + 1, e)
  end
end
