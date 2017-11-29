def ascii_string_value(string)
  string.chars.map {|char| char.ord}.reduce(:+)
end
