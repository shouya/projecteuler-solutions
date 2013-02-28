#

require_relative 'ext_lib'

#require 'ruby-prof'

def check_no_dup?(a)
  a.to_s.each_char.sort.instance_eval { uniq.length == length }
end

def check_pandigital?(a, b, c)
  comp = '' << a.to_s << b.to_s << c.to_s
  return false if comp.length != 9
  return false if comp.include? '0'
  return false if comp.each_char.to_a.sort.uniq.length != 9
  true
end

a_result = []

#RubyProf.start

def bsearch(lb, ub, inc = true, &blk)
  return lb if lb == ub
  mid = (lb + ub) / 2
  rst = blk.call mid
  if rst
    if inc == true
      ub = mid
    else
      lb = mid + 1
    end
  else
    if inc == true
      lb = mid + 1
    else
      ub = mid
    end
  end
  bsearch(lb, ub, inc, &blk)
end

def sum_len(a, b, c)
  a.to_s.length +
    b.to_s.length +
    c.to_s.length
end

def get_upper_bound(x, lo = x, hi = 10 ** 10)
  return lo if lo == hi
  mid = (lo + hi) / 2

  if sum_len(x, mid, x * mid) <= 9
    get_upper_bound(x, mid + 1, hi)
  else
    get_upper_bound(x, lo + 1, mid)
  end
end

def get_lower_bound(x, lo = x, hi = 10 ** 10)
  return lo if lo == hi
  mid = (lo + hi) / 2

  if sum_len(x, mid, x * mid) >= 9
    get_lower_bound(x, lo + 1, mid)
  else
    get_lower_bound(x, mid + 1, hi)
  end
end

get_upper_bound(12)

12.upto(10**9) do |x|
  next unless check_no_dup?(x)
  # [log(x * y)] + [log(x)] + [log(y)]   >= 9 and < 10
  # log(x^2) + log(y^2) == 9
  # y = sqrt(10 ** (9 - log(x^2)))

  lower = get_lower_bound(x)
  upper = get_upper_bound(x)
  lower.upto(upper) do |y|
    z = x * y
    next unless check_pandigital?(x, y, z)
    a_result << [x, y, z]
    p [x, y, z]
    a_result.uniq! {|v| v[2] }
    ap a_result.map {|v| v[2]}.inject(0, &:+)
  end
end

#printer = RubyProf::FlatPrinter.new(RubyProf.stop)
#printer.print(STDOUT)

ap a_result
ap a_result.map {|x| x[2]}.inject(0, &:+)
