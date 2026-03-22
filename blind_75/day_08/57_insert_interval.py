# 57. Insert Interval
# Link: https://leetcode.com/problems/insert-interval/
# Difficulty: Medium

class Solution:
    def insert(self, intervals: List[List[int]], newInterval: List[int]) -> List[List[int]]:
        intervals.append(newInterval)
        intervals.sort(key=lambda interval: interval[0])

        merged = [intervals[0]]

        for interval in intervals[1:]:
            if interval[0] <= merged[-1][1]:
                merged[-1][1] = max(interval[1], merged[-1][1])
            else:
                merged.append(interval)
        
        return merged



