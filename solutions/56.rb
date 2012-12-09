
max_sum = 0

1.upto 100 do |x|
  1.upto 100 do |y|
    a = x ** y
    sum = 0
    a.to_s.each_char do |d|
      sum += d.to_i
    end
    max_sum = sum if sum > max_sum
  end
end

puts max_sum
