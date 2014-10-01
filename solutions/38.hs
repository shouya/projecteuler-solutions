

import Utils

import Data.List



foo :: Integer -> String
foo base = last $
           takeWhile (lenLe 9) $
           map (foldl1 (++)) $
           tail $
           inits $
           map show $
           map (* base) [1..]

bar :: Integer
bar = foldl1 max $
      map (read :: String -> Integer) $
      filter pandigital $
      filter (lenEq 9) $
      filter ('0' `notElem`) $
      map foo $
      filter (noRepeat . show) $
      ([9876,9875..9])
