## A challenge by John Carlos Baez
See [The Riemann Hypothesis Says 5040 is the Last](https://golem.ph.utexas.edu/category/2019/07/the_riemann_hypothesis_says_50.html) and this [challenge](https://twitter.com/johncarlosbaez/status/1149700802371608576) posted on twitter.

Given the prime number factorization of a natural number ```n```, this haskell program calculates the value of 
```haskell
sigma n / (n * log (log n))
``` 
We can use it to find numbers for which this value approaches ```exp gamma ~ 1.7810724```.
With the first 1 million primes and suitable exponents we get to ```1.7810465```:
```haskell
exponents :: [Integer]
exponents = [24,14,12,10,10,9,9,9,9,8,8,8,7,7,7,6,6,6,6,6,6,5,5,5,5,5,5,5,5,5,
  4,4,4,4,4,4,4,4,4,4,4,4] ++ replicate 45 3 ++ replicate 500 2 ++ repeat 1
```
## Revisiting after one week
* I found an interesting [paper](https://projecteuclid.org/euclid.em/1175789744) of 2006 by Keith Briggs on this subject.
* I now realize we can get better efficiency if we handle those big products with a "divide and conquer" approach.  
