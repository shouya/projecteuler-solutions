
require_relative 'ext_lib'

class Fraction
  attr :numerator, :denominator
  def initialize(numerator, denominator)
    @numerator = numerator
    @denominator = denominator
  end

  def recurring_cycle
    numer_stack = []
    numer = @numerator
    pos = 0

    loop {
      quotient = numer / @denominator
      remainder = numer % @denominator
      numer = remainder * 10

      return nil if remainder == 0
      return pos - numer_stack.index(numer) if numer_stack.include?(numer)

      numer_stack << numer
      pos += 1
    }

  end
end

a = (1..1000).to_a
  .map {|b| [b, Fraction.new(1, b).recurring_cycle] }
  .delete_if {|(_,x)| x.nil? }
  .sort {|(_,x), (_,y)| y <=> x}
  .first

ap a

