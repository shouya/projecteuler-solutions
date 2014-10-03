
import Utils

import Data.List

p :: Integer -> Integer
p n = n * (3 * n - 1) `div` 2

{-
in  := Solve[3/2 x^2 - 1/2 x == p, x]
out := {{x -> 1/6 (1 - Sqrt[1 + 24 p])},
        {x -> 1/6 (1 + Sqrt[1 + 24 p])}}
-}


pInv :: (Floating a) => Integer -> a
pInv qp = (1/6 * (1.0 + sqrt (1.0 + 24.0 * (fromIntegral qp))))

isP :: Integer -> Bool
isP = isInt . pInv

pns = map p [1..]

foo = head $
      [n - m |
       n <- pns,
       m <- takeWhile (< n) pns,
       isP (n + m),
       isP (n - m)]



{-
foo = [(n, m, pInvInt (sumP n m)) |
       m <- [1..1000],
       n <- [(m+1)..1000],
       isP (sumP n m)]
-}

{-
bar = [(b,c) |
       (_,b,c) <- foo,
       (d,e,_) <- foo,
       b == d && c == e]
-}
