main :: IO()
main = do {
  x <- readLn ;
  print(prod(x ::(Integer)))
  }

prod :: Integer -> Integer
prod 1 = 3 * 8
prod n = ((2 * n) ^ 2 + 2 * (2 * n)) * ((2 * n - 1) ^ 2 + 2 * (2 * n - 1)) * prod (n - 1)