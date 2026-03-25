def count_smaller(nums)
  sorted = []
  result = Array.new(nums.length, 0)

  (nums.length - 1).downto(0) do |i|
    val = nums[i]
    lo = 0
    hi = sorted.length
    while lo < hi
      mid = (lo + hi) / 2
      sorted[mid] < val ? lo = mid + 1 : hi = mid
    end
    result[i] = lo
    sorted.insert(lo, val)
  end

  result
end
