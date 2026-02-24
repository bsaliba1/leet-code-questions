# 56. Merge Intervals
# Link: https://leetcode.com/problems/merge-intervals/
# Difficulty: Medium

# Sort so that all subsequent values are either in the current interval, extend interval, or separate interval
# Then handle each interval individually
# @param {Integer[][]} intervals
# @return {Integer[][]}
def merge(intervals)
  intervals.sort_by!(&:first)
  merged = [intervals[0]]

  intervals[1..].each do |i|
    if i[0] <= merged.last[1]
      merged.last[1] = [merged.last[1], i[1]].max
    else
      merged << i
    end
  end
  merged
end
