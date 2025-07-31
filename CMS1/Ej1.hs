main :: IO ()
main = do
  x <- readLn
  print (sumaMenosQueMax (x :: (Int, Int, Int)))

sumaMenosQueMax :: (Int, Int, Int) -> Bool
sumaMenosQueMax (a, b, c) = problemaMax a b c > problemaMin a b c + problemaMedio a b c

problemaMax :: Int -> Int -> Int -> Int
problemaMax a b c | a >= b && a >= c = a
                  | b >= a && b >= c = b
                  | c >= a && c >= b = c

problemaMin :: Int -> Int -> Int -> Int
problemaMin a b c | a <= b && a <= c = a
                  | b <= a && b <= c = b
                  | c <= a && c <= b = c

problemaMedio :: Int -> Int -> Int -> Int
problemaMedio a b c | b <= a && a <= c = a
                    | c <= a && a <= b = a
                    | a <= b && b <= c = b
                    | c <= b && b <= a = b
                    | a <= c && c <= b = c
                    | b <= c && c <= a = c