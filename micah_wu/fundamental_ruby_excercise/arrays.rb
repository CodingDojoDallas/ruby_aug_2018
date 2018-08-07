# .at or .fetch
# .delete_at
# .reverse
# .length
# .sort
# .slice
# .shuffle
# .join
# .insert
# values_at() -> returns an array with values specified in the param
# e.g. a = %w{cat dog bear}; puts a.values_at(1,2).join(' and ') #=> "dog and bear"

arr = [1, 2, 3, 4, 5, 6]
arr.at(2) # => 3
arr.fetch(5) # => 6
arr.delete_at(2) # => deleted 3 in array
arr.reverse # => [6,5,4,2,1]
arr.length # => 5
arr.sort # => [1,2,4,5,6]
arr.slice!(-1) # => permanently deletes the end object (because of ! symbol & negative)
arr.shuffle # => shuffles array randomly
arr.join # => "1245"
arr.insert(3,"apple","orange","grapes") # => [1,2,4,"apple","orange","grapes",5]
arr.values_at(1,3,5) # => [2,"apples","grapes"]
