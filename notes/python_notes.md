# Python Notes

## Basics
### Printing:
- Print on same line: `print("...", end = '')`` will prevent a `\n` character to be added to the end of your string
### Declarations:
- Static Functions: `@staticmethod` can be used to declare the following function as static
- Functions: `def func_name(var_name = default_val: var_type) -> output_type: ...`
- Classes: `class ClassName:`
### Operators:
- Ternary: `condition_if_true if condition else condition_if_false`
- Exponent: `2**3 == pow(2,3)`
### Conversion:
- string -> int: `int(mystring)`
- int -> string: `str(myint)`
### Command Line Args
```
import sys
print(sys.argv[1])
```
### Lambdas
- Format: `lambda param1, param2, param3: body`
### Initializing Multiple Vals:
`a,b = [1,2] # a = 1 and b = 2`
### Conversions:
- Use data type names
```
>> str(343)
'343'
>> float(343)
343.0
>> bin(3)
'0b11'
>> bin(7)
'0b111'
>> ...
```

- Get ascii rep of char:
```
>> ord('a')
97
```

### Assertions:
- basic syntax: assert test, control

## Topics
### Math
- Truncating: `//` operator is used for truncating divide
- Reverse Int: Reverse an int with a loop to `% 10` and `/10` (see problem 7)
- Max Int: `float("inf")`
- Min Int: `-float("inf")`
- Get sign of int: `[-1,1][x<0]` **ESSENTIALLY IF ELSE STATEMENT**
- XOR: `x = 0, x^= 1` Note that XOR-ing a number x by the same number twice leaves you with x

### Strings
- Indexing:
    - `mystring[0]` will give you the first letter
    - `mystring[-1]` will give you the last element
- Slicing: (see example 7)
    - syntax - `mystring[first:last:step]` , note if step < 0 then step backwards
        - `mystring[::] == mystring[0:len(mystring)-1]`
        - `mystring[::-1] # reverses string`
    - ex. `"abcdefg"[:0:-2]` outputs "gec"
- Count number of instances of char:
    - `"aaa".count('a') // output: 3`

### Data Structures

#### HashMap:
- `dict()` is used liked a hashmap
- use `in` keyword to check if key is contained in dict

#### Array:
- Empty: `arr = []`
- Initialize w/ values: `arr = [1, 2, 3]`
- Initialize all zeroes: `arr = [0] * N # out = [0,0,0, ...]`
- Initialize w/ pattern: `arr = [1,2,3] * N # out = [1,2,3,1,2,3,...]`
- Check all values in array: `all(x == 0 for x in arr)`
- Can zip two arrays together:
    ```
        names = ['Bob', 'Sandy']
        nums = [1,2]
        mapped = set(zip(names, nums)) //{('Sandy', 2), ('Bob', 1)}
    ```
- **Map**
    - `list(map(func, list_to_map))`
    - ex. `list(map(lambda x: 1 if x == 0 else x, [0,0,2,2])) # returns [1,1,2,2]`
- **Reduce**
- **Filter**
#### Stack:
- Use list as stack
    ```
        stack = [1,2,3]
        stack.append(4) # push
        stack.pop() # pop
        stack[-1] # peak
        if stack:  # false if empty
    ```

- MinStack: (implementation)
    ```
        class MinStack:

        def __init__(self):
            self.__stack = []

        def push(self, x: int) -> None:
            if self.__stack:
                self.__stack.append((x, min(self.__stack[-1][1], x)))
            else:
                self.__stack.append((x, x))

        def pop(self) -> None:
            self.__stack.pop()

        def top(self) -> int:
            return self.__stack[-1][0]

        def getMin(self) -> int:
            if self.__stack:
                return self.__stack[-1][1]
            else:
                return None
    ```

#### Trees
- Traversal
    - Post Order:
        ```
        def printPostorder(node: TreeNode):
            if node is None:
                return

            # first recur on left subtree
            printPostorder(node->left);

            # then recur on right subtree
            printPostorder(node->right);

            # now deal with the node
            print(node.data)
        ```
    - In Order:
        ```
        def printInorder(node: TreeNode):
            if node is None:
                return

            # first recur on left subtree
            printInorder(node->left);

            # then print the node data
            print(node.data)

            # now recur on right subtree
            printInorder(node->right);
         ```
     - Pre Order:
         ```
        def printPreorder(node: TreeNode):
            if node is None:
                return

            # first print the node data
            print(node.data)

            # then recur on left subtree
            printPreorder(node->left);

            # now recur on right subtree
            printPreorder(node->right);
         ```
- Equivalent Trees
    ```
    def checkSubTree(first: TreeNode, second: TreeNode):
        if first and second:
            return first.val == second.val and Solution().checkSubTree(first.left, second.right) and Solution().checkSubTree(first.right, second.left)
        return first == second
    ```
- Binary Search
    ```
    # Returns index of target
    def binarySearch(nums: List[int], target: int) -> int:
        return binarySearchHelper(nums, target, 0, len(nums)-1)

    def binarySearchHelper(nums: List[int], target: int, begin, end) -> int:
        mid = begin+end//2
        if nums[mid] < target: return binarySearchHelper(nums,target, mid+1, end)
        if nums[mid] > target: return binarySearchHelper(nums,target, 0, mid)
        return mid
    ```

#### Heaps
- def: `heap[k] >= heap[2k+1] and heap[k] <= heap[2k+2]`
- minHeap vs maxHeap
- Basic Use:
    ```
    import heapq
    heap = [2,1,4]
    heapq.heapify(heap) // [1,2,4]
    heapq.heappush(heap, 3) // [1,2,4,3]
    ```
    - Heapsort:
        ```
        >>> def heapsort(iterable):
        ...     h = []
        ...     for value in iterable:
        ...         heappush(h, value)
        ...     return [heappop(h) for i in range(len(h))]
        ...
        >>> heapsort([1, 3, 5, 7, 9, 2, 4, 6, 8, 0])
        [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        ```
