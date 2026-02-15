# 121. Best Time to Buy and Sell Stock
# Link: https://leetcode.com/problems/best-time-to-buy-and-sell-stock/
# Difficulty: Easy

# Simple brute force approach to calculating the largest spread between all numbers
# in the set. O(n^2) time complexity
# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
    biggest_spread = 0
    prices.each_with_index do |p1, i1|
        prices[i1+1..].each_with_index do |p2, i2|
            spread = p2 - p1
            biggest_spread = spread if biggest_spread < spread 
        end
    end
    biggest_spread
end

# Keeps track of the smallest number and largest numbers in a given window. Once a new smaller number is hit
# the largest and smallest number in a window is reset but the max spread between the largest and smallest numbers from the previous windows is still tracked
# @param {Integer[]} prices
# @return {Integer}
def max_profit_optimized(prices)
    max_spread = 0 
    highest_in_range = lowest_in_range = prices[0]
    prices.each do |p|
        if p < lowest_in_range
            lowest_in_range = p
            highest_in_range = p
            next
        end   
        if p > highest_in_range
            highest_in_range = p
            max_spread = highest_in_range - lowest_in_range if  highest_in_range - lowest_in_range > max_spread
        end
    end
    max_spread
end

# A modified version of Kandane's Algorithm where the sequence of daily prices is converted into a sequence of spreads
# Then the spreads are summed up sequentially, and a running total spread is tracked. If the current total spread is less than the individual value of a given daily spread,
# becomes the current total spread. If at any moment the current total spread is larger than the tracked max total spread then that current total spread becomes the max
# @param {Integer[]} prices
# @return {Integer}
def max_profit_kadanes_version(prices)
    max_total_spread = 0 
    current_total_spread = 0
    prices.each_index do |i|
        next if i == 0
        spread = prices[i] - prices[i-1]
        current_total_spread = [current_total_spread + spread, spread].max
        max_total_spread = [current_total_spread, max_total_spread].max
    end
    max_total_spread
end
