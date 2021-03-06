module ProjectEuler
         ( readPrimeFile
         , isPrime
         , isPrime'
         , primesBelow
         , isInt
         , isSquareNumber
         , member
         , memberBy
         ) where

import Data.List
import Data.Functor

readPrimeFile :: IO [Integer]
readPrimeFile = map read . lines <$> readFile "../assets/primes.txt"


isPrime :: [Integer] -> Integer -> Bool
isPrime primeList testee = member testee primeList

isPrime' :: Integer -> Bool
isPrime' x = null [y | y<-[2..truncate $ sqrt $ fromIntegral x], x `mod` y == 0]

primesBelow :: [Integer] -> Integer -> [Integer]
primesBelow primeList n = takeWhile (<n) primeList

isInt :: Float -> Bool
-- isInt x = x == fromInteger (round x)
isInt x = 0.0000001 > abs (x - fromInteger (round x))

isSquareNumber :: Integer -> Bool
isSquareNumber n = n == m*m
  where m = floor $ sqrt $ fromInteger n


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
