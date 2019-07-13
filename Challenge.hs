{-# LANGUAGE CPP #-}
{-# LANGUAGE MagicHash #-}
module Challenge where

import Data.List
import GHC.Exts
import GHC.Integer.Logarithms
import qualified Data.Map as M  

-- Copied from https://wiki.haskell.org/Prime_numbers
primesMPE :: [Integer]
primesMPE = 2 : mkPrimes 3 M.empty prs 9   -- postponed sieve enlargement
    where                                 -- by decoupled primes feed loop
    prs = 3 : mkPrimes 5 M.empty prs 9
    mkPrimes n m ps@ ~(p:pt) q = case (M.null m, M.findMin m) of
      { (False, (n2, skips)) | n == n2 ->
             mkPrimes (n+2) (addSkips n (M.deleteMin m) skips) ps q
      ; _ -> if n < q
             then    n : mkPrimes (n+2)  m                  ps q
             else        mkPrimes (n+2) (addSkip n m (2*p)) pt (head pt^2)
      }
    addSkip n m s = M.alter (Just . maybe [s] (s:)) (n+s) m
    addSkips = foldl' . addSkip

integerLog2 :: Integer -> Int
integerLog2 n
  | n < 1       = error "argument must be positive"
  | otherwise   = I# (integerLog2# n)

primes :: [Integer]
primes = take 250000 primesMPE 

geo :: Integer -> Integer -> Integer 
geo p m = div (p^(m+1) - 1) (p - 1)

sigma :: [Integer] -> Integer
sigma xs = product $ zipWith geo primes xs

expand :: [Integer] -> Integer
expand xs = product $ zipWith (^) primes xs

logprimes :: [Double]
logprimes = map (log . fromInteger) primes
  
logvalue :: [Integer] -> Double
logvalue xs = sum $ zipWith (*) (map fromInteger xs) logprimes

inflate :: Integer
inflate = 1000000000000000

betterlog :: Integer -> Double
betterlog x = let
  log2 = fromIntegral $ integerLog2 x
  y = div (x * inflate) (2^log2)
  fraction = log (fromInteger y) - log (fromInteger inflate) 
  in log 2 * fromInteger log2 + fraction

logvalue2 :: [Integer] -> Double
logvalue2 xs = let
  prod = product $ zipWith (^) primes xs
  in betterlog prod

robin ::  [Integer] -> Double
robin xs = fromInteger a / b 
  where n = expand xs
        a = div (sigma xs * inflate) n
        b = fromInteger inflate * log (logvalue2 xs)
        
egamma :: Double
egamma = exp 0.577215664901532860606512090082

exponents :: [Integer]
exponents = [24,14,12,10,10,9,9,9,9,8,8,8,7,7,7,6,6,6,6,6,6,5,5,5,5,5,5,5,5,5,
  4,4,4,4,4,4,4,4,4,4,4,4] ++ replicate 45 3 ++ replicate 300 2 ++ repeat 1

result :: String
result = show $ robin $ exponents
