main :: IO()
main = do {
  x <- readLn ;
  print(sumaPrimerosNImpares(x ::(Integer)))
  }

sumaPrimerosNImpares :: Integer -> Integer
sumaPrimerosNImpares 1 = 4
sumaPrimerosNImpares n | (mod (2 * n - 1) 2 == 0) = 0 + sumaPrimerosNImpares (n - 1)
                               | otherwise = (2 * (2 * n - 1) + 2) + sumaPrimerosNImpares (n - 1)