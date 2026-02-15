# 121. Best Time to Buy and Sell Stock
# Link: https://leetcode.com/problems/best-time-to-buy-and-sell-stock/
# Difficulty: Easy

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

# @param {Integer[]} prices
# @return {Integer}
def max_profit_optimized(prices)
    spread = 0 
    highest_in_range = lowest_in_range = prices[0]
    prices.each do |p|
        if p < lowest_in_range
            lowest_in_range = p
            highest_in_range = p
            next
        end   
        if p > highest_in_range
            highest_in_range = p
            spread = highest_in_range - lowest_in_range if  highest_in_range - lowest_in_range > spread
        end
    end
    spread
end

# @param {Integer[]} prices
# @return {Integer}
def max_profit_kadanes_version(prices)
    largest_spread = 0 
    current_spread = 0
    prices.each_index do |i|
        next if i == 0 
        gain = prices[i] - prices[i-1]
        current_spread = [current_spread, 0].max
        current_spread += gain
        largest_spread = [current_spread, largest_spread].max
    end
    largest_spread
end
