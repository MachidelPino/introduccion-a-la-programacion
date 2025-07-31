module Solucion where

division :: Int -> Int -> Float
division a b = (fromIntegral a) / (fromIntegral b)

-- Ejercicio 1
porcentajeDeVotosAfirmativos :: [(String, String)] -> [Int] -> Int  -> Float
porcentajeDeVotosAfirmativos [] _ _ = 0
porcentajeDeVotosAfirmativos _ _ 0 = 0
porcentajeDeVotosAfirmativos ((x,y):xs) (a:as) j = division(sumaTodosVotos (a:as)) j * 100

sumaTodosVotos :: [Int] -> Int
sumaTodosVotos [] = 0
sumaTodosVotos (x:xs) = x + sumaTodosVotos xs

-- Ejercicio 2
formulasInvalidas :: [(String, String)] -> Bool
formulasInvalidas [] = True
formulasInvalidas ((x,y):xs) | length ((x,y):xs) == 1 && x /= y = False
                             | x == y = True
                             | hayRepetidos(todosCandidatos ((x,y):xs)) = True
                             | otherwise = formulasInvalidas xs

todosCandidatos :: [(String, String)] -> [String]
todosCandidatos [] = []
todosCandidatos ((x,y):xs) = x : y : todosCandidatos xs

hayRepetidos :: [String] -> Bool
hayRepetidos [x] = False
hayRepetidos (x:xs) | elem x xs = True
                    | otherwise = hayRepetidos xs

-- Ejercicio 3
porcentajeDeVotos :: String -> [(String, String)] -> [Int] -> Float
porcentajeDeVotos m [] [] = 0.0
porcentajeDeVotos m ((x,y):xs) (a:as) = porcentajeDeVotos_Aux m ((x,y):xs) (a:as) (sumaTodosVotos (a:as))

porcentajeDeVotos_Aux :: String -> [(String, String)] -> [Int] -> Int -> Float
porcentajeDeVotos_Aux m ((x,y):xs) (a:as) j | m == y = division a j * 100
                                            | otherwise = porcentajeDeVotos_Aux m xs as j

--Ejercicio 4
menosVotado :: [(String, String)] -> [Int] -> String
menosVotado [(x,y)] [a] = x
menosVotado ((x,y):xs) (a:as) = compararVotos (candidatoConSusVotos ((x,y):xs) (a:as))

candidatoConSusVotos :: [(String, String)] -> [Int] -> [(String, Int)]
candidatoConSusVotos [(x,y)] [a] = [(x,a)]
candidatoConSusVotos ((x,y):xs) (a:as) = (x,a) : candidatoConSusVotos xs as

compararVotos :: [(String, Int)] -> String
compararVotos [(x,y)] = x
compararVotos ((x,y):(m,j):xs) | y <= j = compararVotos ((x,y):xs)
                               | otherwise = compararVotos ((m,j):xs)