# ==================================
# Challenge: Useful Methods - Hashes
# ==================================

# [1] .delete(key) => deletes and returns a value associated with the key
#                     In the case below, the first puts will print the value being deleted.
#                     In the second one,
# [ Version #1 ]
name = {
    # Key   |   Value
    # ---------------
    "first" : "Teresa",
    "second": "Obama",
    "middle": "Leticia",
    "last"  : "Gonzales"
}
puts name.delete(:second)
puts name
#
# ALSO
#
# [ Version #2 ]
name = {
    # Key    |    Value
    # -----------------
    "first"  => "Teresa",
    "second" => "Obama",
    "middle" => "Leticia",
    "last"   => "Gonzales"
}
puts name.delete("second")
puts name

# [2]   .empty? => returns true if hash contains no key-value pairs.
#                  The first returns false. The latter returns true.
name = {
    # Key     |    Value
    # ------------------
    "first"  => "Teresa",
    "second" => "Obama",
    "middle" => "Leticia",
    "last"   => "Gonzales"
}
name.empty?

name = {}
name.empty?


# [3] .has_key?(key) => true or false
name = { "first":"Teresa", "second":"Obama", "middle":"Leticia", "last":"Gonzales"}
name.has_key?(:first)

# [4] .has_value?(value) => true or false
name = { "first" => "Teresa", "second" => "Obama", "middle" => "Leticia", "last" => "Gonzales"}
name.has_value?("tagle")