#
require 'benchmark'
=begin
Benchmark.bm do |b|
  b.report(:old) {
    100_000.times do
      n = (rand * 10 ** 9).floor
      n.to_s.chars.sort.uniq.length == n.to_s.length
    end
  }
  b.report(:new) {
    100_000.times do
      n = (rand * 10 ** 9).floor
      s = n.to_s
      next if s.length != 9
      next if s.include? '0'
      ns = Array.new(10)
      s.each_char do |c|
        next if ns.at(c.ord-48)
        ns[c.ord-48] = true
      end
      true
    end
  }
end

def con_prod(num, n)
  return num.pandigital?
end
=end

# a o (1..n) = v

1.upto(9) do |n|
	
end

