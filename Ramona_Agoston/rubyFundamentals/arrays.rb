# Try the following methods at least once either on a separate Ruby file.
#
# .at or .fetch
# .delete
# .reverse
# .length
# .sort
# .slice
# .shuffle
# .join
# .insert
# values_at() -> returns an array with values specified in the param
# e.g. a = %w{cat dog bear}; puts a.values_at(1,2).join(' and ') => "dog and bear"

arr = ["Ramona", "Lindsay", "Mike", "Ida", "Andre", "Cat"]

puts arr.at(0)
puts arr.at(-4)

puts arr.delete("Cat")
puts arr

puts arr.reverse

puts arr.length

puts arr.sort

puts arr[0]
puts arr[1, 3]
puts arr[3..5]

puts arr.shuffle

puts arr.join
puts arr.join(" - ")

puts arr.insert(2, "Dee")
puts arr.insert(5, "Shae", "Meg", "Viorica")

puts arr.values_at(2,4).join(' and ')
