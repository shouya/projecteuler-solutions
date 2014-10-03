module Utils
       ( pandigital
       , noRepeat
       , lenEq
       , lenGt
       , lenGe
       , lenLt
       , lenLe
       , isInt
       , grepV
       , primeFactors
       , primes
       , isPrime
       ) where

import Data.List


pandigital :: String -> Bool
pandigital = pandigitalAux []
  where pandigitalAux _ [] = True
        pandigitalAux rst (x:xs) =
          (x `notElem` rst) && (pandigitalAux (x:rst) xs)

noRepeat :: String -> Bool
noRepeat = pandigital

lenEq :: Integer -> [a] -> Bool
lenEq = lenCmp (==)

lenGt :: Integer -> [a] -> Bool
lenGt = lenCmp (>)

lenGe :: Integer -> [a] -> Bool
lenGe = lenCmp (>=)

lenLt :: Integer -> [a] -> Bool
lenLt = lenCmp (<)

lenLe :: Integer -> [a] -> Bool
lenLe = lenCmp (<=)


type CMP = Integer -> Integer -> Bool
lenCmp :: CMP -> Integer -> [a] -> Bool
lenCmp cmp n str = (genericLength str) `cmp` n


grepV :: (Eq a) => a -> [a] -> [a]
grepV x = filter (x /=)


isInt :: (Eq a, RealFrac a) => a -> Bool
isInt x = x == fromInteger (round x)

primeFactors :: Integer -> [Integer]
primeFactors n =
  case factors of
    [] -> [n]
    _  -> factors ++ primeFactors (n `div` (head factors))
  where factors = take 1 $ filter (\x -> (n `mod` x) == 0) [2 .. n-1]


primes :: [Integer]
primes = 2 : filter (isPrime primes) [3,5..]
  where isPrime (p:ps) n = p*p > n || n `rem` p /= 0 && isPrime ps n


isPrime x = not $ any divisible $ takeWhile notTooBig [2..]
  where divisible y = x `mod`y == 0
        notTooBig y = y*y <= x
