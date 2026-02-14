# @param {Integer[]} nums
# @return {Integer[]}
def product_except_self_slow(nums)
    output = []
    i = 0
    while i < nums.size do
        output.push(
            nums.each_with_index.reduce(1) do |product, (element, index)|
                index == i ? product : product*element
            end
        )
        i+=1
    end
    return output
end

# @param {Integer[]} nums
# @return {Integer[]}
def product_except_self_still_slow(nums)
    output = []
    left = [1]
    right = [1]
    while i < nums.size do i=0
      left.append(
        nums[0..i].reduce(:*)
      )
      right.prepend(
        nums[i..nums.size-1].reduce(:*)
      )
    end

    return output
end

# @param {Integer[]} nums
# @return {Integer[]}
def product_except_self(nums)
        length = nums.size
        left, right, answer = [0]*length, [0]*length, [0]*length
        left[0] = 1
    
        (1..length-1).each do |i|
            left[i] = nums[i - 1] * left[i - 1]
        end
    
        right[length - 1] = 1
        (0..length-2).reverse_each do |i|
            right[i] = nums[i + 1] * right[i + 1]
        end
    
        (0..length-1).each do |i|
            answer[i] = left[i] * right[i]
        end
        return answer
end
