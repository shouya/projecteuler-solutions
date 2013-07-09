
data Fraction = Fraction Integer Integer

instance Show Fraction where
  show (Fraction a b) = (show a) ++ "/" ++ (show b)
instance Eq Fraction where
  (Fraction a b) == (Fraction c d) =
    (fromIntegral a) / (fromIntegral b) == (fromIntegral c) / (fromIntegral d)


data Pair = Pair Fraction Fraction
instance Show Pair where
  show (Pair a b) = (show a) ++ " == " ++ (show b)

pairToInt (Fraction a b) = a * 10 + b
generateFractions n =
  map (\frac@(Fraction a b) -> (Pair frac (Fraction (div a 10) (mod b 10)))) $
  filter (\(Fraction a b) -> a /= b) [Fraction a b|
                                  a <- [x*10 + n| x <- [1..9]],
                                  b <- [n*10 + x| x <- [1..9]]]
pairValid (Pair a b) = a == b


results = map (\(Pair a b) -> b) $ concat [filter pairValid $
                                          generateFractions n | n <- [1..9]]
num_prod = product $ map (\(Fraction n d) -> n) results
den_prod = product $ map (\(Fraction n d) -> d) results

main = do
  putStrLn $ show $ den_prod `div` (gcd den_prod num_prod)

