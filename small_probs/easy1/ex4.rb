# How Many?

def how_many(ary)
  result_hash = {}
  
  loop do
    thing = ary[0]
    things = ary.select { |entry| thing == entry }
    result_hash[thing] = things.length
    ary.delete_if { |entry| thing == entry }
    return result_hash if ary.empty?
  end
end
