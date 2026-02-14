# 155. Min Stack
# Link: https://leetcode.com/problems/min-stack/

# Description:
# Stack that keeps track of the minimum value in the stack whenever a new element is added to the stack

class MinStack:

    def __init__(self):
        self.__stack = []

    def push(self, x: int) -> None:
        if self.__stack:
            self.__stack.append((x, min(self.__stack[-1][1], x)))
        else:
            self.append(x, x)

    def pop(self) -> None:
        self.__stack.pop()

    def top(self) -> int:
        return self.__stack[-1][0]

    def getMin(self) -> int:
        if self.__stack:
            return self.__stack[-1][1]
        else:
            return None

# Your MinStack object will be instantiated and called as such:
# obj = MinStack()
# obj.push(x)
# obj.pop()
# param_3 = obj.top()
# param_4 = obj.getMin()
