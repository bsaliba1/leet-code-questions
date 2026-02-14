# 678. Valid Parenthesis String
# Link: https://leetcode.com/problems/valid-parenthesis-string/

# @param {String} s
# @return {Boolean}
def check_valid_string(s)
    trimmed = trim(s)
    t_s = trimmed.size

    l_index = trimmed.index('(')
    r_index = trimmed.reverse.index(')')

    result = true
    if not l_index.nil?
        s1 = trimmed[l_index..t_s]
        result = analyze(s1)
        if not r_index.nil?
            s2 = trimmed[0..t_s-r_index-1]
            result = result && analyze(s2.reverse)
        end
    elsif not r_index.nil?
        s2 = trimmed[0..t_s-r_index-1]
        result = analyze(s2.reverse)
    end
    
    return result
end

def analyze(s)
    stack = []
    s.each_char do |c|
        if c == '(' or c == ')'
            stack.push(c)
        else
            stack.pop()
        end
    end
    return stack.empty?
end

def trim(s)
    stack = []
    arr_format = s.split('')
    arr_format.each_with_index do |c, i|
        if c == '('
            stack.push(i)
        elsif c == ')'
            if not stack.empty?
                arr_format[stack.pop()] = ''
                arr_format[i] = ''
            end
        end
    end
    return arr_format.join('')
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
