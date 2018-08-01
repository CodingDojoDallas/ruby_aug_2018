hash = {:first_name => "Coding", :last_name => "Dojo"}
hash.delete(:last_name)
p hash

def new_user user = {first_name: "first", last_name: "last"}
    puts "Welcome to our site, #{user[:first_name]} #{user[:last_name]}!"
end
our_user = {first_name: 'Oscar', last_name: "Vazquez"}
new_user
new_user our_user

def new_user greeting="Welcome", first_name: "first", last_name: "last"
    puts "#{greeting}, #{first_name} #{last_name}"
end
our_user = {first_name: "Oscar", last_name: "Vazquez"}
new_user
new_user "Hello", our_user
