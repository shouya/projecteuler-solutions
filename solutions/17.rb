
require_relative './17.lib'
require 'ap'

def get_length(number)
  EnglishNumerals.to_American(number).gsub(/-/, '').split.join.length
end

sum = 0
1.upto 1000 do |i|
  sum += get_length(i)
end

ap sum

