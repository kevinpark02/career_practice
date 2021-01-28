require 'byebug'
# reverse(#7)

def reverse(x)
    return 0 if (x <= -2 ** (31)) || (x >= 2 ** (31) - 1)

    new_num = ""

    x.to_s.reverse.each_char do |char|
        if (char != "-")
            new_num += char
        end
    end

    new_num = (new_num.to_i * -1).to_s if x < 0

    if (new_num.to_i <= -2 ** (31)) || (new_num.to_i >= 2 ** (31) - 1)
        return 0
    else
        new_num.to_i
    end
end

# is_palindrome (#9)

def is_palindrome(num)
    if num.to_s == num.to_s.reverse
        return true
    else
        return false
    end
end

# Roman to Integer (#13)

def roman_to_int(s)
    yr = 0
    roman = {
        "I" => 1,
        "V" => 5,
        "X" => 10,
        "L" => 50,
        "C" => 100,
        "D" => 500,
        "M" => 1000
    }

    s.each_char.with_index do |char, idx|
        if idx == s.length - 1
            yr += roman[s[idx]]
        elsif roman[s[idx]] < roman[s[idx+1]]
            yr -= roman[s[idx]]
        else
            yr += roman[s[idx]]
        end
    end

    return yr

end

# longest_common_prefix (#14)

def longest_common_prefix(strs)
    longest_prefix = []

    return "" if strs.length == 0

    last_idx = strs[0].length - 1

    (0..last_idx).each do |idx|
        strs.each do |str|
            if ((str[idx] == longest_prefix[idx]) || (longest_prefix[idx] == nil))
                longest_prefix[idx] = str[idx]
            else
                longest_prefix[idx] = ""
                return longest_prefix.join("")
            end
        end
    end

    return longest_prefix.join("")

end

# valid parantheses (#20)

def is_valid(s)
    stack = [];
    s.each_char do |bracket|
        stack_el = stack[-1]
        if (bracket == "(" || bracket == "[" || bracket == "{")
            stack.push(bracket)
        elsif (stack_el == "(" && bracket == ")") || (stack_el == "[" && bracket == "]") || (stack_el == "{" && bracket == "}")
            stack.pop
        else
            return false
        end
    end

    stack.empty? ? true : false
end

# Merge Two Sorted Lists (not solved)

def merge_two_lists(l1, l2)

    if (l1.empty? && !l2.empty?)
        return l2
    elsif (!l1.empty? && l2.empty?)
        return l1
    end

    combined = []
    l1.each_with_index do |num, idx|
        if num < l2[idx]
            combined.push(num)
            combined.push(l2[idx])
        elsif num > l2[idx]
            combined.push(l2[idx])
            combined.push(num)
        else
            combined.push(num)
            combined.push(l2[idx])
        end
    end
    return combined
end

# Remove Duplicates (#26)

def remove_duplicates(nums)
    nums.uniq!
    return nums.length
end

# Remove Element

def remove_element(nums, val)
    count = 0
    
    nums.each_with_index do |num, idx|
        if num == val
            delete_idx = nums.index(val)
            deleted = nums.delete_at(delete_idx)
            nums.push(deleted)
        end
    end

    nums.reverse.each do |num|
        if (num == val)
            count += 1
        else
            break
        end
    end

    return nums.length - count

end

# Implement strStr() (#28)

def str_str(haystack, needle)
    if !haystack.include?(needle)
        return -1
    else
        return haystack.index(needle)
    end
end

# Search Insert Position

def search_insert(nums, target)
    if nums.include?(target)
        return nums.index(target)
    else
        nums.each_with_index do |num, idx|
            if (idx == (nums.length - 1) && target > num)
                return idx + 1
            elsif (idx == 0 && target < num)
                return 0
            elsif ((num < target) && (target < nums[idx+1]))
                return idx + 1
            end
        end
    end
end

print(search_insert([1], 0))
puts