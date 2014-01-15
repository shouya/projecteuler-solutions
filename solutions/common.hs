import System.IO

-- readPrimeList :: IO [Integer]
readPrimeList =
  do inx <- openFile "../assets/primes.txt" ReadMode
     str <- hGetContents inx
     hClose inx
     return $ map read $ lines str


main = do primes <- readPrimeList
          map (putStrLn . show) primes
          return ()

