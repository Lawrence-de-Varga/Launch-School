# Short Long Short

def sls(string1, string2)
  case
  when string1.length > string2.length then string2 + string1 + string2
  when string1.length < string2.length then string1 + string2 + string1
  else string1 + string2
  end
end
