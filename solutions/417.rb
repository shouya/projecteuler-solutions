#

require_relative 'ext_lib'
#require 'ruby-prof'


sum = 0

@recur_tbl = []

def recur_cycle(n)
  a = []
  r = 10
  r *= 10 until r >= n
  loop do
    r %= n
    # the following line could be diminished
    # return 0 if r == 0

    r *= 10
    return a.length - a.index(r) if a.index(r)
    a << r
  end
  return 0
end

p recur_cycle(49)


__END__

sum = 0
#RubyProf.start
3.upto 1_000 do |n|
  puts n if n % 1000 == 0
  n /= 2 while n % 2 == 0
  n /= 5 while n % 5 == 0

  next if n == 1

  if p = @recur_tbl.binary_search_assoc(n)
    sum += @recur_tbl[p][1]
  else
    v = recur_cycle(n)
    @recur_tbl << [n, v] unless n > 3000
    sum += v
  end

end
puts sum
#result = RubyProf.stop


# Print a graph profile to text

#printer = RubyProf::FlatPrinterWithLineNumbers.new(result)
#printer.print(STDOUT, {})
