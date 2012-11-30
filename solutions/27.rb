
require_relative 'ext_lib'



(-1000)..upto 1000 do |a|
  (-1000)..upto 1000 do |b|
    formula = lambda {|n| n * n + a * n + b }
    formula.call(1)
  end
end
