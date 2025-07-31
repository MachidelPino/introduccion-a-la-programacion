main :: IO()
main = do {
  x <- readLn ;
  print(sumaDigitos(x ::(Int)))
  }

sumaDigitos :: Int -> Int
sumaDigitos n = sum [read [c] | c <- show n]