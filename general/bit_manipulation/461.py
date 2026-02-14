# 461. Hamming Distance
# Link: https://leetcode.com/problems/hamming-distance/


class Solution:
    def hammingDistance(self, x: int, y: int) -> int:
        xor = x ^ y
        count = 0
        while xor:
            if xor & 1:
                count += 1
            xor >>= 1
        return count

    def hammingDistanceOL(self, x: int, y: int) -> int:
        return bin(x ^ y).count('1')


assert Solution().hammingDistance(6, 4), 1
assert Solution().hammingDistanceOL(6, 4), 1
