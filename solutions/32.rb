
require_relative 'ext_lib'

#require 'ruby-prof'

@a = '0' * 10

def check_pandigital_new(a)
  a.to_s.length.times do
    d = a % 10
    return false if @a[d] == '1' or d == 0
    @a[d] = '1'
    a /= 10
  end
  return true
end

def clear_buffer
  @a = '0' * 10
end

def check_pandigital?(a, b, c)
  comp = '' << a.to_s << b.to_s << c.to_s
  return false if comp.length != 9
  return false if comp.include? '0'
  return false if comp.each_char.to_a.sort.uniq.length != 9
  true
end

def check_pandigital_short?(a)
  return false if a.to_s.include? '0'
  return false if a.to_s.each_char.to_a.sort.uniq.length != a.to_s.length
  true
end

a_result = []

#RubyProf.start

10.upto(100) do |x|
  clear_buffer
  next unless check_pandigital_new(x)
#  next
  x.upto(400) do |y|
    puts y
     next unless check_pandigital_new(y)
#    next unless check_pandigital_new(x * y)
#    if check_pandigital?(x, y, x * y)
    a_result << [x, y, x * y]
#    end
  end
end

#printer = RubyProf::FlatPrinter.new(RubyProf.stop)
#printer.print(STDOUT)

ap a_result
ap a_result.map {|x| x[2]}.inject(0, &:+)

