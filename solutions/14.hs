-- import qualified Data.Map.Lazy as M

import Mem
import Data.Word
import Control.Monad.Fix

type IntType = Int

memoizedChainLen :: IntType -> Int
memoizedChainLen = unsafeTreeMemInt chainLen

chainLen :: IntType -> Int
chainLen 1 = 1
chainLen n = 1 + memoizedChainLen (nextIter n)

nextIter :: IntType -> IntType
nextIter n
  | even n = n `div` 2
  | odd  n = n * 3 + 1

result :: IntType
result = snd $ maximum [(memoizedChainLen n, n) | n <- [1..1000000]]

main :: IO ()
main = print result
