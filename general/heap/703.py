# 703. Kth Largest Element in a Stream
# Link: https://leetcode.com/problems/kth-largest-element-in-a-stream/
import heapq
from typing import List


class KthLargest:
    def __init__(self, k: int, nums: List[int]):
        self.heap = []
        for n in nums:
            if len(self.heap) < k:
                heapq.heappush(self.heap, n)
            else:
                if n > self.heap[0]:
                    heapq.heappushpop(self.heap, n)
        self.k = k

    def add(self, val: int) -> int:
        if len(self.heap) < self.k:
            heapq.heappush(self.heap, val)
        else:
            if val > self.heap[0]:
                heapq.heappushpop(self.heap, val)
        return self.heap[0]




print(KthLargest(2, [1, 2, 3]).add(4))
