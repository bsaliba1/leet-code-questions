# 11. Container With Most Water
# Link: https://leetcode.com/problems/container-with-most-water/
# Difficulty: Medium

# Set two pointers and always move the pointer that points to the lower line
# @param {Integer[]} height
# @return {Integer}
def max_area(height)
  left = 0
  right = height.length - 1
  area = [height[left], height[right]].min * (right - left)
  while left != right
    if height[left] <= height[right]
      left += 1
    else
      right -= 1
    end
    new_area = [height[left], height[right]].min * (right - left)
    area = [area, new_area].max
  end
  area
end
