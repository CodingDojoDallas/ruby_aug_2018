#!/usr/bin/ruby

# ====================
# Assignment: Basic 13
# ====================

arr_1 = ["Matt", "Josh", "Zack", "Reina"]
arr_2 = ["Mean-stack", "Python-stack", "JS-Fundamental-stack", "Ruby"]
array = arr_1 + arr_2;


# .at or .fetch
# -----------------------------
puts "------------- [ Using \"at\" ]"
puts arr_1.at(2)                            # [ Version #1 ]
puts "------------- [ Using \"fetch\" ]"
puts arr_1.fetch(2)                         # [ Version #2 ]
puts;

# .delete
# -----------------------------
puts "------------- [ Before Deleting ]"
puts array;                                 # Array befor modified
array.delete("Matt")                        # Delete obj. in array by "name"
array.delete_at(arr_1.length)               # Delete obj. in array by "index or id"
puts "------------- [ After  Deleting ]"
puts array;                                 # Array after modified
puts;

# .reverse
# -----------------------------
puts "------------- [ Before Reversing ]"
puts array;
puts
puts "------------- [ After Reversing ]"
puts array.reverse
puts;


# .length
# -----------------------------
print "------------- [ Given arr_1 = ", arr_1, "  ]"
puts; print "The length of arr_1 is  #{ arr_1.length }"
puts; puts;


# .sort
# -----------------------------
puts "------------- [ Before sorting ]"
puts array;
puts
puts "------------- [ After sorting ]"
puts array.sort
puts;


# .slice
# -----------------------------
puts "------------- [ Berfor Using \"Slice\" ]"
puts arr_2; puts
puts "------------- [ After Slicing ]"
# puts arr_2.slice(2,4)                     # [ Version #1 ]
puts arr_2.slice!(2, 4)                    # [ Version #2 ]


# .shuffle
# ----------------------------
puts "------------- [ Before Shuffling ]"
puts array;
puts
puts "------------- [ After Shuffling ]"
puts array.shuffle
puts;


# .join
# ----------------------------
puts "------------- [ Before Using \".join\" ]"
print array;
puts; puts;
puts "------------- [ After joining all elenent in array by '-' ]"
puts array.join('-')
puts;


# .insert
# ----------------------------
puts "------------- [ Before Inserting an Item ]"
puts array;
puts
puts "------------- [ After Inserting a New Item ]"
puts array.insert(-2, "CodingDojo")
puts;


# values_at() -> returns an array with values specified in the param
# => e.g. a = %w{cat dog bear}; puts a.values_at(1,2).join(" and ") #=> "dog and bear"
# -----------------------------
puts "------------- [ Before Utilizing \"values_at\" ]"
puts array;
puts
puts "------------- [ After Utilizing \"values_at\" ]"
puts array.values_at(0,                             # First element
                    (array.length/2).floor,         # Median element (in the middle)
                    -1);                            # last element in the array
puts;