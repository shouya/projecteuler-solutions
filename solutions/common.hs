import System.IO
import Data.List
import Data.List.Ordered

readPrimeFile :: IO [Integer]
readPrimeFile = do
  readFile "../assets/primes.txt" >>= (return . (map read) . lines)


isPrime primeList testee =
  member testee primeList

primeBelow primeList n = takeWhile (<n) primeList


