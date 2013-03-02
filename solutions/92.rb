#

require_relative 'ext_lib'

=begin
require 'benchmark'
Benchmark.bm { |bm|
  bm.report { 1_000_000.times {|x| x.to_s.each_char.map(&:to_i) } }
  bm.report { 1_000_000.times {|x| x.digits } }
}
exit
=end


def digit_chain(n)
  loop do
    return n if n == 1 or n == 89
    n = n.digits.map(&:square).sum
  end
end

count = 0
time do
  #  tmp = 0
  2.upto 10_000_000 do |x|
    count += 1 if digit_chain(x) == 89
    #  (tmp = x + 1_0000; puts x) if x >= tmp
  end
end

puts count
