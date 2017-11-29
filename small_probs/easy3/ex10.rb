# Palindromic Numbers

def palindrome?(input)
  input.reverse == input
end

def real_palindrome?(string)
  palindrome?(string.downcase.gsub(/[^a-z,0-9]/, ''))
end

def palindromic_number?(number)
  real_palindrome?(number.to_s)
end
