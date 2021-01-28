# is_palindrome (#9)

def is_palindrome(num)
    if num.to_s == num.to_s.reverse
        return true
    else
        return false
    end
end

# Roman to Integer

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