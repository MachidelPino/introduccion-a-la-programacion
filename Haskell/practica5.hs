{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
import BooleanFormula (BooleanFormula)
{-# HLINT ignore "Use foldr" #-}
{-# HLINT ignore "Use camelCase" #-}
{-# HLINT ignore "Use notElem" #-}
{-# HLINT ignore "Use infix" #-}
--Ejercicio 1--
--1.1--
longitud :: [t] -> Int
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

--1.2--
ultimo :: [t] -> t
ultimo (x:xs) | longitud (x:xs) == 1 = x
              | otherwise = ultimo xs

--1.3--
principio :: [t] -> [t]
principio (x:xs) | longitud (x:xs) == 1 = []
                 | otherwise = x : principio xs

--1.4--
reverso :: [t] -> [t]
reverso (x:xs) | longitud (x:xs) == 1 = [x]
               | otherwise = reverso xs ++ [x]

--Ejercicio 2--
--2.1--
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece m (x:xs) | m == x = True
                   | longitud (x:xs) == 1 = False
                   | otherwise = pertenece m xs

--2.2--
todosIguales :: (Eq t) => [t] -> Bool
todosIguales [] = True
todosIguales (x:xs) | longitud (x:xs) == todosIguales_Aux (x:xs) = True
                    | otherwise = False

todosIguales_Aux :: (Eq t) => [t] -> Int
todosIguales_Aux (x:xs) | longitud (x:xs) == 1 = 0
                        | longitud (x:xs) == 2 && x == head xs = 2
                        | x == head xs = 1 + todosIguales_Aux xs
                        | otherwise = todosIguales_Aux xs

--2.3--
todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos [] = True
todosDistintos (x:xs) | longitud (x:xs) == 1 = True
                      | not (pertenece x xs) = todosDistintos xs
                      | otherwise = False

--2.4--
hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos [] = False
hayRepetidos (x:xs) | longitud (x:xs) == 1 = False
                    | pertenece x xs = True
                    | otherwise = hayRepetidos xs

--2.5--
quitar :: (Eq t) => t -> [t] -> [t]
quitar j [] = []
quitar j (x:xs) | not (pertenece j (x:xs)) = x:xs
                | j == x = xs
                | j == head xs = x : tail xs
                | otherwise = x : quitar j xs

--2.6--
quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos j [] = []
quitarTodos j (x:xs) | not (pertenece j (x:xs)) = x:xs
                     | j == x = quitarTodos j xs
                     | j == head xs = x : quitarTodos j (tail xs)
                     | otherwise = [x] ++ [head xs] ++ quitar j (tail xs)

--2.7--
eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos [] = []
eliminarRepetidos (x:xs) | not (elem x xs) = x : eliminarRepetidos xs
                         | otherwise = eliminarRepetidos xs

--2.8--
mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos (x:xs) (y:ys) | mE_Aux (x:xs) (y:ys) && mE_Aux (y:ys) (x:xs) = True
                              | otherwise = False

mE_Aux :: (Eq t) => [t] -> [t] -> Bool
mE_Aux [] (y:ys) = True
mE_Aux (x:xs) (y:ys) | elem x (y:ys) = mE_Aux xs (y:ys)
                     | otherwise = False

--2.9--
capicua :: (Eq t) => [t] -> Bool
capicua (x:xs) | (x:xs) == reverso (x:xs) = True
               | otherwise = False

--Ejercicio 3--
--3.1--
sumatoria :: [Integer] -> Integer
sumatoria [x] = x
sumatoria (x:xs) = x + sumatoria xs

--3.2--
productoria :: [Integer] -> Integer
productoria [x] = x
productoria (x:xs) = x * productoria xs

--3.3--
maximo :: [Integer] -> Integer
maximo [x] = x
maximo (x:xs) | x >= head xs = maximo (x:tail xs)
              | otherwise = maximo xs

--3.4--
sumarN :: Integer -> [Integer] -> [Integer]
sumarN j [x] = [x + j]
sumarN j (x:xs) = x + j : sumarN j xs

--3.5--
sumarElPrimero :: [Integer] -> [Integer]
sumarElPrimero (x:xs) = sumarN x (x:xs)

--3.6--
sumarElUltimo :: [Integer] -> [Integer]
sumarElUltimo (x:xs) = sumarN (head(reverso (x:xs))) (x:xs)

--3.7--
pares :: [Integer] -> [Integer]
pares [] = []
pares (x:xs) | even x = x : pares xs
             | otherwise = pares xs

--3.8--
multiplosDeN :: Integer -> [Integer] -> [Integer]
multiplosDeN j [] = []
multiplosDeN j (x:xs) | mod x j == 0 = x : multiplosDeN j xs
                      | otherwise = multiplosDeN j xs

--3.9--
ordenar :: [Integer] -> [Integer]
ordenar [] = []
ordenar (x:xs) = menorValor (x:xs) : ordenar (quitar (menorValor (x:xs)) (x:xs))

menorValor :: [Integer] -> Integer
menorValor [x] = x
menorValor (x:xs) | x <= head xs = menorValor (x:tail xs)
                  | otherwise = menorValor xs

--Ejercicio 4--
--4.1--
sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos [] = []
sacarBlancosRepetidos [x] = [x]
sacarBlancosRepetidos (x:y:xs) | x == y && x == ' ' = sacarBlancosRepetidos xs
                               | otherwise = x : y : sacarBlancosRepetidos xs

--4.2--
contarPalabras_Aux :: [Char] -> Integer
contarPalabras_Aux [] = 0
contarPalabras_Aux [x] = 1
contarPalabras_Aux (x:xs) | x == ' ' = 1 + contarPalabras_Aux xs
                          | otherwise = contarPalabras_Aux xs

contarPalabras :: [Char] -> Integer
contarPalabras (x:xs) = contarPalabras_Aux (sacarBlancosRepetidos (x:xs))

--4.3--
