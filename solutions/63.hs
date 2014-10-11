import Control.Monad

foo = [ a |
        n <- [1..20],
        a <- let max_n_digit = 10 ^ n - 1
                 min_n_digit = 10 ^ (n - 1)
                 in_between  = liftM2 (&&) (<= max_n_digit) (>= min_n_digit)
                 proper      = in_between . (^n)
             in takeWhile proper $ dropWhile (not . proper) [0..]]


ans = 1 + length foo
