require 'pebbles/lovelive'

b = Pebbles::LoveLive
puts b.class

x = b.send("honoka")
puts x.class
puts x.cv

y = b.send(nil)
puts y.class
puts y.cv
