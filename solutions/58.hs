--
-- rewritten program
-- the previous one was died under my happy operation `cat>58.hs;^D`
--

import ProjectEuler
import Data.List

type NumPair = (Integer, Integer)

spiral :: [NumPair]
-- spiral = [(floor $ ((sqrt (fromIntegral n - 1))+1)/2+1, n) | n <- [1..]]
spiral = [(floor $ ((sqrt (fromIntegral n - 1))+3)/2, n) | n <- [1..]]

groupByLayer :: [NumPair] -> [[NumPair]]
groupByLayer sprl = groupBy (\a b -> fst a == fst b) spiral

findCorners :: [[NumPair]] -> [[NumPair]]
findCorners grp = map corner grp
  where corner [x] = [x]  -- for the first one
        corner xs = map ((!!) xs . fromIntegral) [l*2-3,l*4-5,l*6-7,l*8-9]
          where l = fst $ head xs

joinGroups :: [[NumPair]] -> [NumPair]
joinGroups = concat

countPrimes :: [NumPair] -> [(Integer, Integer)]
countPrimes cornerList =
  scanl count (0,0) cornerList
  where count (np,nn) (l,n)
          | isPrime' n = (np+1, nn+1)
          | otherwise  = (np,   nn+1)

calcFrequency :: [(Integer, Integer)] -> [NumPair] -> [(Float, NumPair)]
calcFrequency count cornerList =
  map (\(c,p) -> (fromIntegral (fst c)/fromIntegral (snd c), p)) $
    zip count cornerList

getResult freqList = head $ dropWhile (\(a,b) -> a >= 0.1) freqList

main = do
  putStrLn $ show $ getResult $
    calcFrequency (drop ndrop $ counting) (drop ndrop cornerNums)
--  putStrLn $ show $ take 10 $ zip (drop ndrop $
--     counting primes) (drop ndrop cornerNums)
  where cornerNums = (joinGroups . findCorners . groupByLayer) spiral
        counting = countPrimes cornerNums
        ndrop = 10




--------------------
-- 17 16 15 14 13 --
-- 18 5  4  3  12 --
-- 19 6  1  2  11 --
-- 20 7  8  9  10 --
-- 21 22 23 24 25 --
--------------------
-- corners:
--  ly1: [0]
--  ly2: [1,3,5,7]
--  ly3: [3,7,11,15]
--  ly4: [5,11,17,23]
--






