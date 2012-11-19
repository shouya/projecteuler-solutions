
# not done

require_relative 'ext_lib'



def all_abundant_nums
  Marshal.load(File.read('23.gen.data'))
end

st = Time.now
puts 'loading all abundant numbers'
an = all_abundant_nums
puts 'calculating combinations'
sum_of_comb = an.combination(2).map {|(x,y)| x + y}.to_a.sort.uniq
puts 'getting all positive num'
all_pos = (1..28123).to_a
puts 'reducing'
result = all_pos - sum_of_comb
puts 'summarizng'
ap 'result: ' + result.inject(&:+).to_s
puts 'time used: ' + (Time.now - st).to_s + 's'



