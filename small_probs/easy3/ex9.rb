# Palindromix stings (part 2)

def palindrome?(input)
  input.reverse == input
end

def real_palindrome?(string)
  palindrome?(string.downcase.gsub(/[^a-z]/, ''))
end
