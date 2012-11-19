
class Integer
  def proper_factors
    1.upto(self).select {|x| (self%x).zero? }.to_a[0..-2]
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
end


def all_abundant_nums
  (12..(28123-12)).to_a.select(&:abundant_number?)
end

puts 'generating'
File.write('23.gen.data', Marshal.dump(all_abundant_nums))
puts 'done'
