

import Utils

myPrimes = dropWhile (<= 1000) $
           takeWhile (>= 10000) $
           primes

foo n = sort $
        filter isPrime $
        filter (\xs -> last xs `elem` "2468") $
        permutations $
        show n
