-- import ProjectEuler
import Data.List


parseTriangle :: String -> [[Integer]]
parseTriangle str =
  map (map read . words) $ lines str


-------------
--    3    --
--   7 4   --
--  2 4 6  --
-- 8 5 9 3 --
-------------


exampleTriangle = "3\n7 4\n2 4 6\n8 5 9 3"

foldTriangle :: [Integer] -> [Integer] -> [Integer]
foldTriangle xs ys =
  map (maxpair xs) (zip [0..] ys)
  where maxpair xs y
          | fst y == 0             = snd y + head xs
          | fst y == length xs     = snd y + last xs
          | otherwise              = snd y + max (xs!!(fst y - 1)) (xs!!fst y)


main = do
  triangle <- readFile "../assets/67-triangle.txt" >>= (return . parseTriangle)
  putStrLn $ show $ foldl1 max $ foldl1 foldTriangle triangle
  return ()
--    where triangle = parseTriangle exampleTriangle
