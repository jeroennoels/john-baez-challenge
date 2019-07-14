See [The Riemann Hypothesis Says 5040 is the Last](https://golem.ph.utexas.edu/category/2019/07/the_riemann_hypothesis_says_50.html) and [A CHALLENGE](https://twitter.com/johncarlosbaez/status/1149700802371608576).

Given the prime number factorization of a natural number n, this program efficiently calculates sigma(n) / (n log (log n)).  We can use it to find numbers for which the value approaches exp(gamma) ~ 1.7810724.

A product of the first 1 million primes, with suitable exponents, yields sigma(n) / (n log (log n)) = 1.7810465.

```haskell
exponents :: [Integer]
exponents = [24,14,12,10,10,9,9,9,9,8,8,8,7,7,7,6,6,6,6,6,6,5,5,5,5,5,5,5,5,5,
  4,4,4,4,4,4,4,4,4,4,4,4] ++ replicate 45 3 ++ replicate 500 2 ++ repeat 1
```
