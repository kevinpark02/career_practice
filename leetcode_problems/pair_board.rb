require 'byebug'
# 01A

# Digital Root

def digital_root(num)
    return num if num < 10

    answer = digit_parse(num)
    return digital_root(answer)
end

def digit_parse(num)
    num_dup = num
    parsed = []

    while num_dup > 9
        remainder = num_dup % 10
        parsed.unshift(remainder)
        num_dup /= 10
    end
    parsed.unshift(num_dup)
    parsed.sum
end

# Caesar Cipher

def caesar_cipher(msg, increment)
    alphabet = ("a".."z").to_a

    msg.each_char.with_index do |char, idx|
        if char != " "
            og_idx = alphabet.index(char)
            new_idx = (og_idx + increment) % 26
            msg[idx] = alphabet[new_idx]
        end
    end
    msg
end

# 01B

#! longest_common_substring

def longest_common_substring(str1, str2)
    substrings = []
    longest = ""

    str1.each_char.with_index do |char1, idx1|
        str1.each_char.with_index do |char2, idx2|
            if idx2 > idx1
                substrings << str1[idx1..idx2]
            end
        end
    end

    substrings.each do |substring|
        if str2.include?(substring) && (substring.length > longest.length)
            longest = substring
        end
    end

    longest

end

# sum_rec

def sum_rec(nums)
    return 0 if nums.length == 0

    return nums[0] + sum_rec(nums[1..-1])
end

# 02A

# fibs

def fibs_iter(num)
    res = []
    i = 0
    while i < num
        if i == 0
            res << 0
        elsif i == 1
            res << 1
        else
            res << res[i - 2] + res[i -1]
        end
        i += 1
    end
    res
end

def fibs_rec(num)
    return [] if num == 0
    return [0] if num == 1
    return [0, 1] if num == 2

    prev_fib = fibs_rec(num - 1)
    prev_fib << prev_fib[-1] + prev_fib[-2]

    prev_fib

end

# 02B

#! valid_ip?

def valid_ip?(ip)
    ip_parsed = ip.split(".").map{ |el| el.to_i }
    
    if ip_parsed.length < 4 || ip_parsed.length > 4
        false
    end
    
    ip_parsed.all? { |num| num >= 0 && num <= 255 }
end

print valid_ip?("14.23.111.255")
puts

# sum_from_file

def sum_from_file
    
end