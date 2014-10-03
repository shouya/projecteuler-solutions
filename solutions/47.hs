import Utils

import Data.List


nPrimeFactors :: Integer -> Int
nPrimeFactors = length . nub . primeFactors



pfeq4 n = nPrimeFactors n == 4

bar 4 n = n
bar a n = if pfeq4 (n+a)
          then bar (succ a) n
          else bar 0       (succ (n+a))

foo = bar 0 40000
