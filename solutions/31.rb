

CURRENCIES = [1, 2, 5, 10, 20, 50, 100, 200].sort.reverse

$counter = 0

def recursion(idx, rest)
  ($counter += 1; return) if rest == 0
  return if CURRENCIES[idx].nil?

  0.upto(rest / CURRENCIES[idx]) do |x|
    recursion(idx + 1, rest - CURRENCIES[idx] * x)
  end
end

recursion(0, 200)

puts $counter

