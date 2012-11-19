# https://projecteuler.net/problem=18
require 'ap'

@data = File.read('18.data').each_line.map(&:chomp).map(&:split)
  .map {|x| x.map(&:to_i) }

@result = 0
@result_len = 0

def save_result(num)
  @result_len += 1
  @result = num if num > @result
end

def recursion(line, index, sum)
  ele = @data[line][index]

  if line == @data.length - 1
    save_result(sum + ele)
    return
  end

  recursion(line + 1, index, sum + ele)
  recursion(line + 1, index + 1, sum + ele)
end

recursion(0, 0, 0)

puts @result
puts @result_len
