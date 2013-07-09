

isPrime :: Integer -> Bool
isPrime n
  | n < 0     = False
  | otherwise = null $ filter (\x -> n `mod` x == 0) $ takeWhile (\x -> x*x <= n) [2..]


data Generator = Generator Integer Integer Integer deriving (Eq, Show)
instance Ord Generator where
  (Generator _ _ n1) `compare` (Generator _ _ n2) = n1 `compare` n2

nPrime :: Integer -> Integer -> Integer
nPrime a b =
  fromIntegral $ length $ takeWhile (\x -> isPrime (x * x + a * x + b)) [0..]

-- nPrime a b =
--   fromIntegral $ length $ takeWhile (\x -> isPrime (x * x + a * x + b)) $
--                  takeWhile (\x -> (b `mod` x) /= 0) [2..]



-- main = do
--   putStrLn $ show $ foldl max (Pair 0 0 0) [Pair a b (fromIntegral $ nPrime a b) |
--                                             a <- [(-999), (-997)..999],
--                                             b <- [(-999), (-997)..999]]

-- reference: http://code.jasonbhill.com/sage/project-euler-problem-27/


primesBelow :: Integer -> [Integer]
primesBelow n = takeWhile (<(fromIntegral n)) $ filter isPrime [2..]

primes = primesBelow 1000


func :: Integer -> Integer -> Generator -> [Integer] -> Generator
func _ _ gen [] = gen
func a b gen@(Generator max_a max_b max_m) (p:primes) =
  if b > max_m then
     let m = nPrime a b in
     if m > max_m  then
       func a p (Generator a b m) primes
     else
       func a p gen primes
  else
    func a p gen primes

main = do
  putStrLn $ show gen
  let (Generator a b _) = gen in putStrLn $ show (a * b)
  where gen = foldl max (Generator 0 0 0)
              [(func a 0 (Generator 0 0 0) primes) | a <- [(-999), (-997)..1001]]








