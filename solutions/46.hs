
import ProjectEuler

testForN :: [Integer] -> Integer -> Bool
testForN plist n =
  any testForN' (primesBelow plist n)
  where testForN' prime =
          isInt $ sqrt ((fromIntegral (n - prime)) / 2)

main = do
  primeList <- readPrimeFile
  (putStrLn . show . head) $
    dropWhile (testForN primeList) $
    filter (not . isPrime primeList) oddNumberList
  where oddNumberList = [i*2+1 | i <- [1..]]

