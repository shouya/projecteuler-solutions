#


require 'ap'
require 'date'


class Fiboacci
  attr_reader :val, :no
  attr :old_val

  def initialize
    @old_val = 0
    @val = 1
    @no = 1
  end

  def next
    @old_val, @val = @val, @old_val + @val
    @no += 1
    @val
  end
end


class Integer
  def proper_factors
    1.upto((self / 2) + 1).select {|x| (self%x).zero? }.to_a
  end
  def prime?
    proper_factors.length == 1
  end
  def abundant_number?
    self < self.proper_factors.inject(&:+)
  end
  def perfect_number?
    self == self.proper_factors.inject(&:+)
  end
  def deficient_number?
    self > self.proper_factors.inject(&:+)
  end

  def square
    self * self
  end
  def digits
    rst = []
    tmp = self
    while tmp > 0
      rst.unshift tmp % 10
      tmp /= 10
    end
    rst
  end

  def pandigital?
    s = n.to_s
    next if s.length != 9
    next if s.include? '0'
    ns = Array.new(10)
    s.each_char {|c| return false if ns.at(c.ord-48); ns[c.ord-48] = true }
    true
  end

  def num_digits
    to_s.size
  end
end

# A fast combination count algorithm
def combination_count(n, r)
  rst = 1
  n.downto(n - r + 1) do |x|
    rst *= x
  end
  r.downto(2) do |x|
    rst /= x
  end
  rst
end

class String
  def pandigital?
    each_char.sort.uniq.length == length
  end
end


class Array
  # binary search for sorted array
  def binary_search(ele, lo = 0, hi = self.length - 1)
    return (ele == self[lo]) ? lo : nil if lo == hi
    mid = (lo + hi) / 2
    return mid if ele == self[mid]
    return binary_search(ele, lo, mid) if ele < self[mid]
    return binary_search(ele, mid + 1, hi)
  end

  def sum
    sum = 0
    each do |x|
      sum += x
    end
    sum
  end
end


def time(&block)
  beg = Time.now
  block.call(beg)
  puts 'Time spent: ' + (Time.now - beg).to_s + ' second(s).'
end
