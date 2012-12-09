
require_relative 'ext_lib'

counter = 0

(1..100).map do |n|
  (1..n).map do |r|
    counter += 1 if combination_count(n, r) > 1_000_000
  end
end


puts counter
