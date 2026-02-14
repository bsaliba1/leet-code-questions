# 678. Valid Parenthesis String
# Link: https://leetcode.com/problems/valid-parenthesis-string/

# Works but Too Slowly

PAREN = [')', '(', '']

# @param {String} s
# @return {Boolean}
def check_valid_string(s)
    s_map = stars_map(s)
    num_stars = s_map.size
    s_arr = s.split('')
    counter = 3**num_stars    #00 01 02 10 11 12 20 21 22
    while counter>0
        counter_cp = counter
        (0..num_stars-1).each do |x|
            bit = counter_cp%3
            counter_cp/=3
            s_arr[s_map[x]] = PAREN[bit]
        end
        if test(s_arr.join(''))
            return true
        end
        counter -= 1
    end
    return false
end

def test(s)
    stack = []
    s.each_char do |c|
        if c == '('
            stack.push(c)
        else
            if stack.empty?
                return false
            end
            stack.pop()
        end
    end
    return stack.empty?
end

def stars_map(s)
    return (0 ... s.length).find_all { |i| s[i] == '*' }
end
        
=begin

TESTCASES

"()"
"*))"
"(*"
"*(*"
"**((*"
"**(((*(*(((((((*(*"
"*()(())*()(()()((()(()()*)(*(())((((((((()*)(()(*)"
")*"
"*)*"
"*)*))))))*)*)*))**"
"()()((*()()(*()((())()))))(()())))(((()*())))))(())()))((*(())))))()))))())*(())()(()(*))*(*"
"*))"
"(*"
"*))(*"

=end

