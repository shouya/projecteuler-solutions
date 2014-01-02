require './ext_lib'

n_tbl = Hash.new(0)

1.upto(999999) do |a|
	break if a >= 1000
	a.upto(999999) do |b|
		c = (a ** 2 + b ** 2) ** 0.5
		break if a + b + c > 1000
		next if c.to_i != c
		puts "#{a} #{b} #{c.to_i}"
		n_tbl[a+b+c.to_i] += 1
	end
end

ap n_tbl.to_a.sort_by(&:last).last.first

