# 292. Nim Game
# Link: https://leetcode.com/problems/nim-game/

# --- Problem ---
# You are playing the following Nim Game with your friend: There is a heap of stones on the table, each time
# one of you take turns to remove 1 to 3 stones. The one who removes the last stone will be the winner.
# You will take the first turn to remove the stones.
# Both of you are very clever and have optimal strategies for the game.
# Write a function to determine whether you can win the game given the number of stones in the heap.

# --- Solution ---
# You can't win the game unless you have rocks numbering a multiple of 4.


# --- Explanation ---
# If you have 1,2,3 -> rocks you always win.
# If you have 4 rocks you always lose (you take 1,2 or 3 rocks then your opponent takes the remainder)
# So the optimal strategy is to get to a case where your opponent is left with 4 rocks
# because then they will lose. What if you have 5 then you take 1 and your opponent is left with the 4 rocks which we've already established they can't win.
# Same goes for 6 and 7. What about 8? Then how many do you take. In reality it doesn't matter because you've already lost.
# Why? Well regardless of what you pick your opponent can take a number of rocks which will leave you at 4 rocks where you will always lose
# This same idea can be applied whenever we are left with a number of rocks that is a multiple of 4

class Solution:
    def canWinNim(self, n: int) -> bool:
        return False if n % 4 == 0 else True

sol = Solution()
print(sol.canWinNim(9))
