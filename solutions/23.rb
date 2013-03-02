require_relative 'ext_lib'

# Method:
#  1. run 23.prog.rb to generate a abundant number list (~70s)
#  2. run 23.rb to calculate the sum (~45s)
#

# answer: 4179871

def all_abundant_nums
  Marshal.load(File.read('23.gen.data'))
end

st = Time.now
puts 'loading all abundant numbers'
an = all_abundant_nums
puts 'getting all positive numbers'
sum = 0
(1..28124).each do |x|
  if !an.select{|y| y < x}.any? {|y| an.binary_search(x - y) }
    puts x
    sum += x
  end
end

ap 'result: ' + sum.to_s
puts 'time used: ' + (Time.now - st).to_s + 's'


#
