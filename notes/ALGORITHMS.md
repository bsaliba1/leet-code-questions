# Algorithms

## Sliding Window
- If number of "other" values is <= k, expand right (end += 1)
- Otherwise shift right (start += 1 AND end += 1)
- Answer is the final size of the window
- O(n) time complexity
- Problems: 424 (Longest Repeating Character Replacement), 3 (Longest Substring Without Repeating Chars)

## Binary Search
- Divide search space in half each iteration
- Compare target to middle element, recurse into left or right half
- O(log n) time complexity
- For rotated arrays: find the pivot (rotation point), unpivot, binary search, then map index back using modular arithmetic
- For finding minimum in rotated array: if mid < high, minimum is in left half (high = mid); otherwise in right half (low = mid + 1)
- Problems: 704 (Binary Search), 33 (Search in Rotated Sorted Array), 153 (Find Minimum in Rotated Sorted Array)

## Bucket Sort
- Get the count/frequency of each element
- Create buckets indexed by count
- Collect values from buckets in reverse order until result reaches size k
- O(n) time complexity
- Problems: 347 (Top K Frequent Elements)

## Kadane's Algorithm
- Track current_sum and max_sum while iterating
- At each element: current_sum = max(current_sum + x, x) — restart subarray if adding x makes it worse
- max_sum = max(max_sum, current_sum)
- For products (not sums): track both current_min and current_max since negatives can flip
  - min = min(current_min * x, current_max * x, x)
  - max = max(current_min * x, current_max * x, x)
- Can also be applied to stock prices by converting prices to daily spreads
- O(n) time complexity
- Problems: 53 (Maximum Subarray), 152 (Maximum Product Subarray), 121 (Best Time to Buy/Sell Stock - modified version)

## Two Pointers
- Set two pointers (start/end or left/right) and move them based on a condition
- For sorted arrays: if sum < target, move left pointer right; if sum > target, move right pointer left
- For container/area problems: always move the pointer that points to the lower value
- Skip duplicates by advancing pointer while value equals next value
- O(n) time complexity
- Problems: 11 (Container With Most Water), 15 (3Sum - two pointer for inner two sum), 125 (Valid Palindrome)

## Fast & Slow Pointers (Tortoise and Hare)
- One pointer moves twice as fast as the other
- If they meet on the same node, there's a cycle
- Problems: 141 (Linked List Cycle)

## DFS (Depth First Search)
- Recurse into children before siblings
- For trees: pass min/max bounds to validate BST properties
- For grids: mark visited cells and explore all 4 directions (up/down/left/right)
- Tip: maintaining a conditional — `is_valid = is_valid && additional_condition`
- Problems: 98 (Validate BST), 104 (Max Depth - DFS version), 200 (Number of Islands), 235 (Lowest Common Ancestor)

## BFS (Breadth First Search)
- Use a queue, process all nodes at current level before moving to next
- Process `queue.length` nodes per level to track depth
- Problems: 104 (Max Depth - BFS version), 102 (Level Order Traversal), 226 (Invert Binary Tree)

## Stack
- Add opening elements to stack, pop and compare when closing element is encountered
- If stack is empty at the end, all elements matched
- Problems: 20 (Valid Parentheses)

## Interval Merging
- Sort intervals by start value
- If next interval's start <= current interval's end, merge by taking max of both ends
- Otherwise it's a separate interval
- For inserting: append new interval, sort, then merge normally
- For non-overlapping (minimize removals): sort by end value; if intervals overlap, skip the one with the larger end
- Problems: 56 (Merge Intervals), 57 (Insert Interval), 435 (Non-overlapping Intervals)

## Hash Map / Set
- Use hash map for O(1) lookups of complements, counts, or indexes
- For two sum: store value -> index, then check if complement exists
- For counting: use Hash.new(0) to count frequencies
- For anagrams: use letter count array as hash key to group words
- For consecutive sequences: use a set, find sequence starts (n-1 not in set), then count forward
- Problems: 1 (Two Sum), 217 (Contains Duplicate), 242 (Valid Anagram), 49 (Group Anagrams), 128 (Longest Consecutive Sequence)

## Prefix / Suffix Products
- Build prefix product array (left to right) and suffix product array (right to left)
- Result at index i = prefix[i] * suffix[i]
- Avoids division, handles zeros
- Problems: 238 (Product of Array Except Self)

## Matrix Traversal
- To modify values based on a condition: first pass to collect which rows/columns need changing, second pass to apply the changes
- Avoids modifying the matrix while reading it (which can corrupt the condition check)
- Problems: 73 (Set Matrix Zeroes)

## Linked List Traversal
- For merging: compare heads of both lists, pick smaller, advance that list
- For reversing: save values by adding to front of array (unshift)
- For reordering (L0→Ln→L1→Ln-1...): collect nodes into array, then use two pointers (front/back) to weave them together
- For removing nth from end: collect nodes into array, then update the (n+1)th-from-end node's next pointer
- Problems: 21 (Merge Two Sorted Lists), 206 (Reverse Linked List), 143 (Reorder List), 19 (Remove Nth Node From End)
