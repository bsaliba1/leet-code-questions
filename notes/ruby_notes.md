# Ruby Notes

## Basics
### Comments
- Single Line: `x = 7 # comment goes after hash`
- Multi Line:
    - Method 1 
    ```
    # First Line
    # Second Line
    # Third Line
    ```
    - Method 2
    ```
    =begin
    First Line
    Second Line
    Third Line
    =end
    ```

### Data Types:
- Ranges
    - upper and lower bounds are inclusive unlike python
    - init: `x = 1..7`
    - iterate: 
    ```
    x.each do |i|
        [code]
    end
    ```
    - reverse iterate:
    ```
    x.reverse_each do |i|
    [code]
    end
    ```
### Printing:
- `puts` is similar to print – calling `to_s` – but adds a newline to the output
- `p` is similar to puts in that it adds a newline, but rather than calling `to_s`, p calls inspect.
### Declarations:
### Operators:
- Ternary: `condition ? if_true : if_false` 
- Exponent: `2**3 # 8`
- Chaining:
```
x = y = 2
x *= y *= 2
# x = 8, y = 4
```
### Command Line Args
### Lambdas
### Initializing Multiple Vals:
- different values: `x, y = 1, 2`
- same values: `x = y = 1` 
### Conversions:
### Assertions:
## Topics
### Math
### Strings
- Split string into chars: `"hello".split('') # ['h','e','l','l','o']`
- Combine chars into string: `['h','e','l','l','o'].join('') # "hello"`
- Count instances of char a char in a string `"hello".count('l') # 2` 
### Data Structures
#### Bit Vector
- Not built in data structure just a way of using an int
- Get right most bit val: 
```
# Note this is assuming it is a base 2 bit vector
# If not base 2 then use bit_vector % n, where n is the base
bit_vector = 7
right_most = bit_vector % 2
```
- Get all but right most bits:
```
# Note this is assuming it is a base 2 bit vector
# If not base 2 then use bit_vector / n, where n is the base
bit_vector = 7
remainder = bit_vector/2
```
#### HashMap:
- Initialize a hashmap with specific value if key does not exist
```ruby
my_map = Hash.new(10)
my_map["a"] += 1
my_map["a"]
# 11
my_map["b"]
# 10
```

#### Sets
- Initialize a set with values 
```ruby
s = Set.new([1,2,3,1])
s.length
# 3
``` 

#### Array:
- init with zeroes: `arr = [0]*length #length is size you want`
- **Map**
- **Reduce**
- **Filter**
#### Stack:
#### Trees
#### Heaps
