#

require_relative 'ext_lib'

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
    get_upper_bound(x, lo, mid)
  end
end

def get_lower_bound(x, lo = x, hi = 10 ** 10)
  return lo if lo == hi
  mid = (lo + hi) / 2

  if sum_len(x, mid, x * mid) >= 9
    get_lower_bound(x, lo, mid)
  else
    get_lower_bound(x, mid + 1, hi)
  end
end

2.upto(10**9) do |x|
  next unless check_no_dup?(x)

  lower = get_lower_bound(x)
  upper = get_upper_bound(x)
  lower.upto(upper) do |y|
    z = x * y
    next unless check_pandigital?(x, y, z)
    a_result << [x, y, z]
    p [x, y, z]
    a_result.uniq! {|v| v[-1] }
    ap a_result.map {|v| v[2]}.inject(0, &:+)
  end
end

ap a_result
ap a_result.map {|x| x[2]}.inject(0, &:+)
