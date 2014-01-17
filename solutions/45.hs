
isInt :: Float -> Bool
-- isInt x = x == fromInteger (round x)
isInt x = 0.00001 > abs (x - fromInteger (round x))

main = do
	putStrLn . show $ take 5 [ (truncate $ (a*a+a) / 2) |
			a <- [1..],
			isInt ((1+a)/2) &&
			isInt (1/6*(1+sqrt (1+12*a+12*a*a)))]

