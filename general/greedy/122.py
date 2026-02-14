# 122. Best Time to Buy and Sell Stock II
# Link: https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/

from typing import List


class Solution:
    def maxProfit(self, prices: List[int]):
        i = 0
        valley = prices[0]
        peak = prices[0]
        max_profit = 0
        while i < (len(prices) - 1):
            while i < (len(prices) - 1) and prices[i] >= prices[i + 1]:
                i += 1
            valley = prices[i]
            while i < (len(prices) - 1) and prices[i] <= prices[i + 1]:
                i += 1
            peak = prices[i]
            max_profit += peak - valley
        return max_profit

    def maxProfitConsecutive(self, prices: List[int]):
        max_profit = 0
        for i in range(0, len(prices)-1):
            if prices[i] < prices[i+1]: max_profit += prices[i+1] - prices[i]
        return max_profit


print(Solution().maxProfit([7, 1, 5, 3, 6, 4]))
print(Solution().maxProfitConsecutive([7, 1, 5, 3, 6, 4]))
