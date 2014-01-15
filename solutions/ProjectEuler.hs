module ProjectEuler
         ( readPrimeFile
         , isPrime
         , primesBelow
         , isInt
         ) where

import Data.List

readPrimeFile :: IO [Integer]
readPrimeFile = do
  readFile "../assets/primes.txt" >>= (return . (map read) . lines)


isPrime :: [Integer] -> Integer -> Bool
isPrime primeList testee = member testee primeList



primesBelow :: [Integer] -> Integer -> [Integer]
primesBelow primeList n = takeWhile (<n) primeList


isInt :: Float -> Bool
-- isInt x = x == fromInteger (round x)
isInt x = 0.0000001 > abs (x - fromInteger (round x))


-- Picked from Data.List.Ordered
member :: Ord a => a -> [a] -> Bool
member = memberBy compare

memberBy :: (a -> a -> Ordering) -> a -> [a] -> Bool
memberBy cmp x = loop
  where
    loop []     = False
    loop (y:ys) = case cmp x y of
      LT -> False
      EQ -> True
      GT -> loop ys

