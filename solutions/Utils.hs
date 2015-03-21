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
       , distinctPrimeFactors
       , breakIntoDigits
       , isPermutation
       , module Data.List
       , module Data.Function
       , module Control.Arrow
       , module Data.Numbers.Primes
       ) where

import Data.List
import Data.Function
import Control.Arrow hiding (arr)
import Data.Numbers.Primes
import Control.Monad.ST
import Control.Monad
import Data.Array.ST

pandigital :: String -> Bool
pandigital = pandigitalAux []
  where pandigitalAux _ [] = True
        pandigitalAux rst (x:xs) =
          x `notElem` rst && pandigitalAux (x:rst) xs

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
lenCmp cmp n str = genericLength str `cmp` n


grepV :: (Eq a) => a -> [a] -> [a]
grepV x = filter (x /=)


isInt :: (Eq a, RealFrac a) => a -> Bool
isInt x = x == fromInteger (round x)

distinctPrimeFactors :: Integral a => a -> [a]
distinctPrimeFactors n = filter ((== 0) . rem n) pm
  where pm = takeWhile (<= (fromIntegral n `div` 2)) primes

breakIntoDigits :: Int -> [Int]
breakIntoDigits 0 = []
breakIntoDigits n = (n `rem` 10) : breakIntoDigits (n `div` 10)

isPermutation :: Int -> Int -> Bool
isPermutation a b = runST $ do
  arr <- newArray (0,9) 0 :: ST s (STUArray s Int Int)
  forM_ (breakIntoDigits a) $ \x -> do
    n <- readArray arr x
    writeArray arr x (n+1)
  forM_ (breakIntoDigits b) $ \x -> do
    n <- readArray arr x
    writeArray arr x (n-1)
  elems <- getElems arr
  return $ all (==0) elems
