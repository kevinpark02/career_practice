require 'byebug'
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

print(longest_common_prefix(["flower","flow","flight"]))
puts