a = ['Matz', 'Guido', 'Dojo', 'Gibson', 'John']
b = [5, 6, 9, 3, 1, 2, 4, 7, 8, 10]

puts a.shuffle.join('-')
a.delete('Matz')
puts a
puts "Length of a is #{a.length}"
puts a.reverse
puts "array a at 3 #{a.at(3)}" 
puts b.sort
puts b[1..3]
puts b.insert(2, 99)
puts b.values_at(2, 4, 6)