# 997. Find the Town Judge
# Link: https://leetcode.com/problems/find-the-town-judge/

from typing import List


class Solution:
    @staticmethod
    def findJudge(N: int, trust: List[List[int]]) -> int:
        trust_given = [0]*(N+1)
        trust_received = [0]*(N+1)
        for x, y in trust:
            trust_given[x] += 1
            trust_received[y] += 1
        for i in range(1, N+1):
            if trust_given[i] == 0 and trust_received[i] == N-1:
                return i
        return -1

    @staticmethod
    def findJudgeGraph(N:int, trust: List[List[int]]) -> int:
        graph = [0]*(N+1)
        for x, y in trust:
            graph[y] += 1
            graph[x] -= 1
        for i in range(1, N+1):
            if graph[i] == N-1:
                return i
        return -1


print(Solution().findJudge(1, []))
print(Solution().findJudgeGraph(1, []))
print(Solution().findJudge(4, [[1, 3], [1, 4], [2, 3], [2, 4], [4, 3]]))
print(Solution().findJudgeGraph(4, [[1, 3], [1, 4], [2, 3], [2, 4], [4, 3]]))

def findJudge(N: int, trust: List[List[int]]) -> int:
   graph = [0]*(N+1)
   for x, y in trust:
       graph[y] += 1
       graph[x] -= 1
   for i in range(1, N+1):
       if graph[i] == N-1:
           return i
   return -1
