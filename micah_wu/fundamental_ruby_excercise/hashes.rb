# our_hash = {:first_name => "Coding", :last_name => "Dojo"}
#new way
# our_hash = {first_name: "Coding", last_name: "Dojo"}
# puts our_hash

# def new_user user = {first_name: "first", last_name: "last"}
#   puts "Welcome to our site, #{user[:first_name]} #{user[:last_name]}!"
# end
# our_user = {first_name: 'Oscar', last_name: "Vazquez"}
# new_user # => "Welcome to our site, first last!"
# new_user our_user # => "Welcome to our site, Oscar Vasquez!"

# def new_user first_name: "first", last_name: "last"
#   puts "Welcome to our site, #{first_name} #{last_name}!"
# end

# def new_user greeting="Welcome", first_name: "first", last_name: "last"
#     puts "#{greeting}, #{first_name} #{last_name}"      
# end
# our_user = {first_name: "Oscar", last_name: "Vazquez"}
# new_user                  # => Welcome, first last
# new_user "Hello", our_user # => Hello, Oscar Vazquez

#---------------------------------------------------------------------------------------

# .delete(key) => deletes and returns a value associated with the key
# In the case below, the first puts will print the value being deleted. In the second one,

name = { "first": "micah", "second": "mikey", "middle": "nichone", "last": "wu"}
puts name.delete(:second)
puts name

# ALSO

name = { "first" => "micah", "second" => "mikey", "middle" => "nichone", "last" => "wu"}
puts name.delete("second")
puts name

# .empty? => returns true if hash contains no key-value pairs. The first returns false. The latter returns true.

name = { "first" => "micah", "second" => "mikey", "middle" => "nichone", "last" => "wu"}
puts name.empty?

name = {}
puts name.empty?

# .has_key?(key) => true or false

name = { "first":"micah", "second":"mikey", "middle":"nichone", "last":"wu"}
puts name.has_key?(:first)

# .has_value?(value) => true or false

name = { "first" => "micah", "second" => "mikey", "middle" => "nichone", "last" => "wu"}
puts name.has_value?("nichone")