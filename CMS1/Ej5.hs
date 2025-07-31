combinacionesMenoresOIguales :: Integer -> Integer
combinacionesMenoresOIguales 1 = 1
combinacionesMenoresOIguales n = suma_i (n) (n)

aux_bool :: Integer -> Integer -> Integer -> Bool
aux_bool i j n = i * j <= n


suma_i :: Integer -> Integer -> Integer
suma_i n i | i == 1 = n
           | suma_j (i - 1) (n) (n)

suma_j :: Integer -> Integer -> Integer -> Integer
suma_j i j n | j == 1 = 1
             | aux_bool i j n = 1 + suma_j i (j-1) n
             | otherwise = suma_j i (j-1) n