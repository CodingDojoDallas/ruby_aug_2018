# ==================================
#         Assignment: Names
# ==================================
#
# => Given:
#       a = {:first_name => "Michael", :last_name => "Choi"}
#       b = {:first_name => "John", :last_name => "Supsupin"}
#       c = {:first_name => "KB", :last_name => "Tonel"}
#       d = {:first_name => "Jessie", :last_name => "De Leon"}
#       e = {:first_name => "Jaybee", :last_name => "Balog"}
#       names = [a, b, c, d, e]
#
# => Requirements:
#      <>  Create a ruby method that goes over each name in the names array
#      <>  Program shall be able to replicate a print statements like below.
#-------------------------------------------------------------------------
# You got 5 names in the 'names' array
# The name is 'Michael Choi'
# The name is 'John Supsupin'
# The name is 'KB Tonel'
#-------------------------------------
a = {:first_name => "Michael",  :last_name => "Choi"}
b = {:first_name => "Matt",     :last_name => "Tucker"}
c = {:first_name => "Josh",     :last_name => "Doe"}
d = {:first_name => "James",    :last_name => "Smith"}
e = {:first_name => "Jennifer", :last_name => "Smith"}

names = [a, b, c, d, e]
puts "You got #{ names.length.to_s } names in the 'names' array"
names.each { |name| puts "The name is '#{name[:first_name]} #{name[:last_name]}'" }