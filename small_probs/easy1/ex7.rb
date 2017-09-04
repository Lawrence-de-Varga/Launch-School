# String Strings
def ones_and_zeros(int)
  switch = '1'
  string = ''

  until int == 0
    string += switch
    int -= 1
    switch == '1' ? switch = '0' : switch = '1'
  end
  string
end
