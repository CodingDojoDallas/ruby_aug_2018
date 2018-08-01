def all_names
  a = {first_name: "Prajesh", last_name: "Gohel"}
  b = {first_name: "Anna", last_name: "Peck"}
  c = {first_name: "Billy", last_name: "Wu"}
  d = {first_name: "Riya", last_name: "Wasnik"}
  e = {first_name: "Stephen", last_name: "Decker"}
  names = [a, b, c, d, e]
  puts "You have "+names.length.to_s+" names in the 'all_names' array"
  names.each { |name| puts "The name is #{name[:first_name]} #{name[:last_name]}"}
end

all_names
