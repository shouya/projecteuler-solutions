

-- a^2 + b^2 = c^2
-- a + b + c = p

-- p * (p - 2c) = 2 * a * b

factors :: Integer -> [Integer]
factors n = [x | x <- [1..s], n `mod` x == 0]
  where s = floor (sqrt (fromIntegral n))

-- result = map (\p -> (/2) . length $ factors $ filter even $
--                     map (\c -> (p * (p - 2*c)))
--                     [c | c <- [1..(div p 2)]]) [1..1000]

result = map helper [1..1000]
  where helper p =  (map ((/2) . fromIntegral . length . factors) .
                    filter even .
                    map (\c -> (p * (p - 2*c))))
                    [c | c <- [1..(div p 2)]]

