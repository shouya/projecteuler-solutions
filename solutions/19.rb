require_relative 'ext_lib'

result = 0

Date.new(1901,1,1).upto Date.new(2000,12,31) do |d|
  next unless d.mday == 1
  next unless d.sunday?

  result += 1
end

ap result
