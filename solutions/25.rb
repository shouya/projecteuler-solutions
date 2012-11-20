
require_relative 'ext_lib'

fib = Fiboacci.new

while fib.val.to_s.length != 1000
  fib.next
end

# puts fib.val
puts fib.no







