require_relative 'ext_lib'


primes = File.read('../assets/primes.txt').each_line.map(&:to_i)

N = 1_000_000
max_len = 10
loop do
  sum = 0
  p_idx = 0
  len = 0
  break if primes.first > N

  primes.each do |p|
    sum += p
    len += 1
    break if sum >= N

    if len >= max_len and sum.prime?
      puts "#{sum} -- #{len}"
      max_len = len
    end
  end

  primes.shift
end
