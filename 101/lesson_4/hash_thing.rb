produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(produce)
  selected_produce = produce.dup
  counter = 0
  keys = selected_produce.keys

  loop do
    break selected_produce if counter == produce.size

    key = keys[counter]

    selected_produce.delete(key) unless selected_produce[key] == 'Fruit'

    counter += 1
    end
end


def doubled_numbers(numbers)
  new_numbers = []
  counter = 0

  loop do
    break new_numbers if counter == numbers.length
  
    new_numbers << (numbers[counter] * 2)

    counter += 1
  end
end

def doubled_numbers!(numbers)
  counter = 0

  loop do
    break numbers if counter == numbers.length

    numbers[counter] *= 2 

    counter += 1
  end
end


def doubled_odd_numbers(numbers)
  counter = 0

  loop do
    break numbers if counter == numbers.length
    
    numbers[counter] *= 2 if numbers[counter].odd?

    counter += 1
  end
end

def double_every_other_number(numbers)
  counter = 0
  new_numbers = []

  loop do
    break new_numbers if counter == numbers.length

    new_numbers << (counter.odd? ? numbers[counter] * 2 : numbers[counter])

    counter += 1
  end
end 

def general_select(produce, selection_criteria)
  selected_produce = {}
  keys = produce.keys

  counter = 0

  loop do
    break selected_produce if produce.length == counter

    key = keys[counter]
    selected_produce[key] = produce[key] if produce[key] == selection_criteria
    
    counter += 1
  end
end
    
def multiplay_array(numbers, factor)
  new_numbers = []

  counter = 0

  loop do
    break new_numbers if numbers.length == counter

    new_numbers << (numbers[counter] * factor)

    counter += 1
  end
end

def select_letter(string, letter)
  new_string = ''

  counter = 0

  loop do 
    break new_string if string.length == counter

    new_string << letter if string[counter] == letter

    counter += 1
  end
end










