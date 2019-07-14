{-# LANGUAGE MagicHash #-}
module Challenge where

import Data.List
import GHC.Exts
import GHC.Integer.Logarithms
import qualified Data.Map as M  
import Primes

integerLog2 :: Integer -> Int
integerLog2 n
  | n < 1       = error "argument must be positive"
  | otherwise   = I# (integerLog2# n)

primes :: [Integer]
primes = take numPrimes primesMPE 

geo :: Integer -> Integer -> Integer 
geo p m = div (p^(m+1) - 1) (p - 1)

sigma :: [Integer] -> Integer
sigma xs = product $ zipWith geo primes xs

expand :: [Integer] -> Integer
expand xs = product $ zipWith (^) primes xs

inflate :: Integer
inflate = 100000000000000000

betterlog :: Integer -> Double
betterlog x = let
  log2 = fromIntegral $ integerLog2 x
  y = div (x * inflate) (2^log2)
  fraction = log (fromInteger y) - log (fromInteger inflate) 
  in log 2 * fromInteger log2 + fraction

robin ::  [Integer] -> Double
robin xs = fromInteger a / b 
  where n = expand xs
        a = div (sigma xs * inflate) n
        b = fromInteger inflate * log (betterlog n)
        
egamma :: Double
egamma = exp 0.577215664901532860606512090082

numPrimes = 1000000

-- trial and error!
exponents :: [Integer]
exponents = [24,14,12,10,10,9,9,9,9,8,8,8,7,7,7,6,6,6,6,6,6,5,5,5,5,5,5,5,5,5,
  4,4,4,4,4,4,4,4,4,4,4,4] ++ replicate 45 3 ++ replicate 500 2 ++ repeat 1

result :: String
result = show $ robin $ exponents
