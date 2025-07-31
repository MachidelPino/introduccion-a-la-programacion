{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use camelCase" #-}
{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
--Ejercicio 1--
fibonacci :: Integer -> Integer
fibonacci n | n == 0 = 0
            | n == 1 = 1
            | otherwise = fibonacci(n - 1) + fibonacci(n - 2)

--Ejercicio 2--
parteEntera :: Float -> Integer
parteEntera x | 0 < x && x < 1 = 0
              | x < 0 = parteEntera(x + 1) - 1
              | otherwise = parteEntera(x - 1) + 1

--Ejercicio 3--
esDivisible :: Integer -> Integer -> Bool
esDivisible x y | x == 0 = True
                | abs x < abs y = False
                | x > 0 && y > 0 = esDivisible (x - y) y
                | x > 0 && y < 0 = esDivisible (x + y) y
                | x < 0 && y > 0 = esDivisible (x + y) y
                | x < 0 && y < 0 = esDivisible (x - y) y

--Ejercicio 4--
sumaImpares :: Integer -> Integer
sumaImpares x | x == 1 = 1
              | even x = sumaImpares(x - 1) + x*2 - 1
              | otherwise = sumaImpares(x - 1) + x*2 - 1

--Ejercicio 5--
medioFact :: Integer -> Integer
medioFact 0 = 1
medioFact 1 = 1
medioFact x = medioFact(x - 2) * x

--Ejercicio 6--
sumaDigitos :: Integer -> Integer
sumaDigitos 0 = 0
sumaDigitos x = sumaDigitos(sacoUltimo x) + ultimoDigito x

--Ejercicio 7--
todosDigitosIguales :: Integer -> Bool
todosDigitosIguales x | x < 10 = True
                      | ultimoDigito x == penUltimoDigito x = todosDigitosIguales (sacoUltimo x)
                      | otherwise = False

ultimoDigito :: Integer -> Integer
ultimoDigito x = mod x 10

penUltimoDigito :: Integer -> Integer
penUltimoDigito x = mod (sacoUltimo x) 10

sacoUltimo :: Integer -> Integer
sacoUltimo x = div x 10

--Ejercicio 8--
iesimoDigito :: Integer -> Integer -> Integer
iesimoDigito m i | i == cantDigitos m = ultimoDigito m
                 | otherwise = iesimoDigito (sacoUltimo m) i

cantDigitos :: Integer -> Integer
cantDigitos n | n < 10 = 1
              | otherwise = cantDigitos(sacoUltimo n) + 1

--Ejercicio 9--
esCapicua :: Integer -> Bool
esCapicua x | x == 0 = True
            | cantDigitos x == 1 = True
            | odd (cantDigitos x) = False
            | compararDigitos (primerDigito x) (ultimoDigito x) = esCapicua(sacoUltimo(x - primerDigito x * 10^(cantDigitos x - 1)))
            | otherwise = False

primerDigito :: Integer -> Integer
primerDigito x = div x (10^(cantDigitos x - 1))

compararDigitos :: Integer -> Integer -> Bool
compararDigitos x y | x == y = True
                    | otherwise = False

--Ejercicio 10--
f1 :: Integer -> Integer
f1 0 = 1
f1 x = 2^x + f1(x - 1)
--  problema f1(x: Z): Z{
--             requiere: {x >= 0}
--             asegura: {res = TerminoMaximo=n Sumatoria i=0 (2^i)}
--  }


f2 :: Integer -> Float -> Float
f2 1 q = q
f2 n q = q^n + f2 (n - 1) q
--  problema f2(n: Z, q: R): R{
--             requiere: {True}
--             asegura: {res = TerminoMaximo=n Sumatoria i=1 (q^i)}
--  }


f3 :: Integer -> Float -> Float
f3 0 q = 0
f3 1 q = q^2 + q
f3 n q = q^(2*n) + q ^(2*n - 1) + f3(n - 1) q
--  problema f3(n: Z, q: R): {
--             requiere: {n >= 0}
--             asegura: {res = TerminoMaximo=2*n Sumatoria i=1 (q^i)}
--  }


f4 :: (Integer, Float) -> Float
f4 (0, q) = 1
f4 (n, q) = q^(2*n) + q ^(2*n - 1) - q^(n - 1) + f4(n - 1, q)
--  problema f4(n: Z, q: R): R{
--             requiere: {n >= 0}
--             asegura: {res = TerminoMaximo=2*n Sumatoria i=n (q^i)}
--  }


--Ejercicio 11--
eAprox :: Float -> Float
eAprox 0 = 1
eAprox n = (1 / factorial n) + eAprox(n - 1)

factorial 0 = 1
factorial n = n * factorial (n - 1)
--Falta especificar y 11.b--

--Ejercicio 12--
sucesion :: Integer -> Float
sucesion 1 = 2
sucesion n = 2 + (1 / sucesion(n - 1))

raizDe2Aprox :: Integer -> Float
raizDe2Aprox n = sucesion (n - 1)
--No da exacto lo q dice la guia--

--Ejercicio 13--:
sumatoriaM 1 n = n
sumatoriaM m n = n^m + sumatoriaM (m - 1) n

fSumatorias :: Integer -> Integer -> Integer
fSumatorias 1 m = m
fSumatorias n m = sumatoriaM m n + fSumatorias(n - 1) m

--Ejercicio 14--
sumaNconM q n 1 = q^(n + 1)
sumaNconM q n m = q^(n + m) + sumaNconM q n (m - 1)

sumaTodosNconTodosM q 1 m = sumaNconM q 1 m
sumaTodosNconTodosM q n m = sumaNconM q n m + sumaTodosNconTodosM q (n - 1) m

sumaPotencias :: Integer -> Integer -> Integer -> Integer
sumaPotencias = sumaTodosNconTodosM

--Ejercicio 15--
sumaRacionalesNconTodosM :: Float -> Float -> Float
sumaRacionalesNconTodosM n 1 = n
sumaRacionalesNconTodosM n m = n/m + sumaRacionalesNconTodosM n (m - 1)

sumaRacionalesTodosNconM :: Float -> Float -> Float
sumaRacionalesTodosNconM 1 m = sumaRacionalesNconTodosM 1 m
sumaRacionalesTodosNconM n m = sumaRacionalesNconTodosM n m + sumaRacionalesTodosNconM (n - 1) m

sumaRacionales :: Float -> Float -> Float
sumaRacionales = sumaRacionalesTodosNconM

--Ejercicio 16.a--
menorDivisor :: Integer -> Integer
menorDivisor x = menorDivisor_Aux x 2

menorDivisor_Aux :: Integer -> Integer -> Integer
menorDivisor_Aux x i | mod x i == 0 = i
                     | otherwise = menorDivisor_Aux x (i + 1)

--Ejercicio 16.b--
esPrimo :: Integer -> Bool
esPrimo x | menorDivisor x == x = True
          | otherwise = False

--Ejercicio 16.c--
sonCoprimos :: Integer -> Integer -> Bool
sonCoprimos x y | sonCoprimos_Aux x y 2 == 0 = True
                | otherwise = False

sonCoprimos_Aux :: Integer -> Integer -> Integer -> Integer
sonCoprimos_Aux x y z | z > x || z > y = 0
                      | mod x z == 0 && mod y z == 0 = 1
                      | otherwise = sonCoprimos_Aux x y (z + 1)

--Ejercicio 16.d--
nEsimoPrimo :: Integer -> Integer
nEsimoPrimo x = nEsimoPrimo_Aux x 2

nEsimoPrimo_Aux :: Integer -> Integer -> Integer
nEsimoPrimo_Aux x y | x == 0 = y - 1
                    | esPrimo y = nEsimoPrimo_Aux (x - 1) (y + 1)
                    | otherwise = nEsimoPrimo_Aux x (y + 1)

--Ejercicio 17--
esFibonacci :: Integer -> Bool
esFibonacci x = esFibonacci_Aux x 1

esFibonacci_Aux :: Integer -> Integer -> Bool
esFibonacci_Aux x y | x < fibonacci y = False
                    | x == fibonacci y = True 
                    | otherwise = esFibonacci_Aux x (y + 1)

--Ejercicio 18--
mayorDigitoPar :: Integer -> Integer
mayorDigitoPar x = mayorDigitoPar_Aux (sacoUltimo x) (ultimoDigito x)

mayorDigitoPar_Aux :: Integer -> Integer -> Integer
mayorDigitoPar_Aux x y | cantDigitos x == 1 && x == 0 = compararNumerosPares 1 y
                       | cantDigitos x == 1 = compararNumerosPares x y
                       | odd (ultimoDigito x) && odd y = mayorDigitoPar (sacoUltimo x)
                       | compararNumerosPares (ultimoDigito x) y == ultimoDigito x = mayorDigitoPar_Aux (sacoUltimo x) (ultimoDigito x)
                       | compararNumerosPares (ultimoDigito x) y == y = mayorDigitoPar_Aux (sacoUltimo x) y

compararNumerosPares :: Integer -> Integer -> Integer
compararNumerosPares x y | (even x && even y) && x >= y = x
                         | (even x && even y) && x < y = y
                         | even x && odd y = x
                         | odd x && even y = y
                         | odd x && odd y = -1

--Ejercicio 19--
sumaPrimosN :: Integer -> Integer
sumaPrimosN 1 = 2
sumaPrimosN y = nEsimoPrimo y + sumaPrimosN (y - 1)

esSumaInicialDePrimos_Aux :: Integer -> Integer -> Bool
esSumaInicialDePrimos_Aux x y | x > sumaPrimosN y = esSumaInicialDePrimos_Aux x (y + 1)
                              | x == sumaPrimosN y = True
                              | otherwise = False

esSumaInicialDePrimos :: Integer -> Bool
esSumaInicialDePrimos 0 = False
esSumaInicialDePrimos 1 = False
esSumaInicialDePrimos x = esSumaInicialDePrimos_Aux x 1

--Ejercicio 20--
--No se entiende q carajo es lo q tiene q devolver, es ambiguo, depende como lo interpretes podes hacer q devuelva una cosa u otra--

--Ejercicio 21--
pitagoras_Aux :: Integer -> Integer -> Integer -> Integer -> Integer
pitagoras_Aux m n r j | n == -1 = 0
                      | m == -1 = pitagoras_Aux (m + j + 1) (n - 1) r j
                      | m^2 + n^2 <= r^2 = 1 + pitagoras_Aux (m - 1) n r j
                      | otherwise = pitagoras_Aux (m - 1) n r j

pitagoras :: Integer -> Integer -> Integer -> Integer
pitagoras m n r = pitagoras_Aux m n r m

--Faltaron especificar casi todos los q dicen especificar--