import Utils

myPrimes = takeWhile (<= 3333) $
           dropWhile (<= 1000) $
           primes

myCommonDifferences = [3000..9999]

foo = filter coPerms
      [(a0, a0+d, a0+d+d)
      | a0 <- myPrimes
      , d  <- myCommonDifferences
      , isPrime (a0+d)
      , isPrime (a0+d+d)]
  where coPerms (a,b,c) = isPermutation a b && isPermutation b c

main = print foo
