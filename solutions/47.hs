import Utils
import Data.List

beg = 0
n = 3

nPrimeFactors :: Int -> Int
nPrimeFactors = length . distinctPrimeFactors

pfmap :: [(Int, Int)]
pfmap = zip l $ map nPrimeFactors l
  where l = [beg..]

pfgrouped :: [(Int, Int)]
pfgrouped = map merge $ filter ((==n) . snd . head) $ groupBy ((==) `on` snd) pfmap
  where merge = (fst . head) &&& length

ans = find ((==n) . snd) pfgrouped

main = print ans
