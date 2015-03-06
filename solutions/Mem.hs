-- a memorization library
module Mem (treeMemInt, unsafeTreeMemInt) where

import Data.IORef
import System.IO.Unsafe
-- import Data.Word

import           Data.Map.Lazy (Map)
import qualified Data.Map.Lazy as M

type KeyType = Int

memTree :: IO (IORef (Map KeyType a))
memTree = newIORef M.empty

treeMemInt :: (KeyType -> a) -> KeyType -> IO a
treeMemInt f i = do
  refTree <- memTree
  tree    <- readIORef refTree
  case M.lookup i tree of
   Just n  -> return n
   Nothing -> let val = f i in
     do modifyIORef refTree (M.insert i val)
        return val


unsafeTreeMemInt :: (KeyType -> a) -> KeyType -> a
unsafeTreeMemInt f = unsafePerformIO . treeMemInt f
