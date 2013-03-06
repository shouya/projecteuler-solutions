#

require_relative 'ext_lib'

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

    r *= 10 until r >= n
    if p = a.index(r)
      return a.length - p
    end
    a << r
  end
  return 0
end


sum = 0

3.upto(1_000_000) do |n|
  puts n if n % 1000 == 0
  while n % 2 == 0 or n % 5 == 0
    n /= n % 2 == 0 ? 2 : 5
  end
  next if n == 1

  if p = @recur_tbl.binary_search_assoc(n)
    sum += @recur_tbl[p][1]
  else
    @recur_tbl << (v = recur_cycle(n))
    sum += v
  end

end
puts sum


