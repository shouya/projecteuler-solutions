

spiralSum 1 = 1
spiralSum level = 1 + spiralSum' 1 2 (ceiling (level / 2))
  where spiralSum' base level max_level
          | level > max_level = 0
          | otherwise         =
            (sum nums) + spiralSum' (last nums) (level + 1) max_level
          where nums = [base + (level - 1) * 2 * x | x <- [1..4]]



