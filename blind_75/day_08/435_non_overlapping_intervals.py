# 435. Non-overlapping Intervals
# Link: https://leetcode.com/problems/non-overlapping-intervals/
# Difficulty: Medium

class Solution:
    def eraseOverlapIntervals(self, intervals: List[List[int]]) -> int:
        intervals.sort(key=lambda interval: interval[1])
        merged = [intervals[0]]
        skipped = 0
        for interval in intervals[1:]:
            if merged[-1][0] < interval[1] and interval[0] < merged[-1][1]:
                skipped += 1
            else:
                merged.append(interval)

        return skipped
