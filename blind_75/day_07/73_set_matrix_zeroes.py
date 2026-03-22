# 73. Set Matrix Zeroes
# Link: https://leetcode.com/problems/set-matrix-zeroes/
# Difficulty: Medium

class Solution:
    def setZeroes(self, matrix: List[List[int]]) -> None:
        rowCount = len(matrix)
        columnCount = len(matrix[0])
        rowsToZeroOut = []
        columnsToZeroOut = []
        for rowNumber, row in enumerate(matrix):
            for columnNumber, value in enumerate(row):
                if value == 0:
                    rowsToZeroOut.append(rowNumber)
                    columnsToZeroOut.append(columnNumber)
        for rowNumber in rowsToZeroOut:
            matrix[rowNumber] = [0] * columnCount
        for row in matrix:
            for columnNumber in columnsToZeroOut:
                row[columnNumber] = 0
        return matrix
        
