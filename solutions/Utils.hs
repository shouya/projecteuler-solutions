module Utils
       ( pandigital
       , noRepeat
       , lenEq
       , lenGt
       , lenGe
       , lenLt
       , lenLe
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
