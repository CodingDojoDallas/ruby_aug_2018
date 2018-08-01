x = {first_name: "Coding", last_name: "Dojo"}

puts "X is ", x
puts x[:first_name], x[:last_name]

puts x.has_key?(:first_name)

puts "DELETING :first_name"
x.delete :first_name
puts "X is now ", x

puts x.has_key?(:first_name)

puts x.has_value?("Dojo")

puts x.empty?
