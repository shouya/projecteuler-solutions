

---------------------------------------------------
-- 1              1                              --
-- - m (1 + m) == - n (-1 + 3 n) == k (-1 + 2 k) --
-- 2              2                              --
---------------------------------------------------
--- Result ----


isInt :: Float -> Bool
-- isInt x = x == fromInteger (round x)
isInt x = 0.000000000001 > abs (x - (fromIntegral $ round x))

isSquareNumber :: Integer -> Bool
isSquareNumber n = n == m*m
  where m = floor $ sqrt $ fromInteger n

-- main = do
-- 	putStrLn . show $ take 5 [ (floor $ (a*a+a) / 2) |
-- 			a <- [1..],
-- 			isInt ((1+a)/2) &&
-- 			isInt (1/6*(1+sqrt (1+12*a+12*a*a)))]

main = do
  putStrLn $ show $ take 3 [2*k*k-k |
                            k <- [1..],
                            isSquareNumber (1-24*k+48*k*k) &&
                            isInt (((sqrt $ fromIntegral (1+48*k*k-24*k))+1)/6)]

  -- putStrLn $ show $ take 5 [n | n <- [2*k*k-k | k <- [1..]],
  --                           isSquareNumber (1+8*n) &&
  --                           isInt ((-1+sqrt (1+8*(fromIntegral n)))/2) &&
  --                           isSquareNumber (1+24*n) &&
  --                           isInt ((1+sqrt (1+24*(fromIntegral n)))/6)]

