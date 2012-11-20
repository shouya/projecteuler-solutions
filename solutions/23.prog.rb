
require_relative 'ext_lib'

def all_abundant_nums
  (12..(28123-12)).to_a.select(&:abundant_number?)
end

puts 'generating'
File.write('23.gen.data', Marshal.dump(all_abundant_nums))
puts 'done'
