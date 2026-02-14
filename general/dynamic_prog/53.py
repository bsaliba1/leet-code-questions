# 53. Maximum Subarray
# Link: https://leetcode.com/problems/maximum-subarray/

# Simple Solution
def SimpleMaxSubArray(a):
    max_so_far = -float("inf")  # start max so far as negative inf
    max_ending_here = 0
    begin = 0
    end = 0

    for i in range(0, len(a)):
        max_ending_here = max_ending_here + a[i]
        if max_so_far < max_ending_here:
            max_so_far = max_ending_here
            end = i
        else:
            begin = i

        if max_ending_here < 0:
            max_ending_here = 0

    if end < begin:
        return a[0:end + 1]
    else:
        return a[begin + 1:end + 1]


# Dynamic Solution
def dynamicMaxSubArray(nums):
    size = len(nums)
    tempArr = [0] * size
    tempArr[0] = nums[0]
    max_v = tempArr[0]

    for i in range(1, size):
        if tempArr[i - 1] > 0:
            tempArr[i] = nums[i] + tempArr[i - 1]
        else:
            tempArr[i] = nums[i]
        max_v = max(max_v, tempArr[i])

    return max_v


# Driver function to check the above function
a = [1, 2, 15, -18, 8, 4]
print("Maximum contiguous sum is", dynamicMaxSubArray(a))
