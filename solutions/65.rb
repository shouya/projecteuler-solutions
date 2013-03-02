#

# For explanation of the solution, see 65.md

require_relative 'ext_lib'

def b(k)
  return 1 if (k % 3) == 0 or (k % 3) == 1
  n = k / 3
  return 2 * (n + 1)
end

@buff = {}

def buff(name, n, proc)
  @buff[name] ||= {}
  return @buff[name][n] if @buff[name].key? n
  @buff[name][n] = proc.call(n)
  return @buff[name][n]
end

def n(k)
  return 0 if k == 0
  return 1 if k == 1
  return b(k) * buff(:n, k - 1, method(:n)) + buff(:n, k - 2, method(:n))
end

def d(k)
  return 1 if k == 0
  return b(k) if k == 1
  return b(k) * buff(:d, k - 1, method(:d)) + buff(:d, k - 2, method(:d))
end

def a
  2
end


nth = 100
require 'ap'

e = nil
time do
  e = Rational(n(nth - 1), d(nth - 1)) + a
end

ap e
ap e.to_f
ap e.numerator.to_s.each_char.map(&:to_i).inject(0, &:+)
