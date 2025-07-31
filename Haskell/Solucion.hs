module Solucion where
--n_6w8nQQ--
--Ejercicio 1--
relacionesValidas :: (Eq t) => [(t,t)] -> Bool
relacionesValidas [] = True
relacionesValidas ((x,y):xs) = relacionesValidas_Aux1 ((x,y):xs) && relacionesValidas_Aux2 ((x,y):xs)

relacionesValidas_Aux1 :: (Eq t) => [(t,t)] -> Bool
relacionesValidas_Aux1 [] = True
relacionesValidas_Aux1 ((x,y):xs) | length ((x,y):xs) == 1 && x /=y = True
                                  | x /= y = relacionesValidas_Aux1 xs
                                  | otherwise = False

relacionesValidas_Aux2 :: (Eq t) => [(t,t)] -> Bool
relacionesValidas_Aux2 [] = True
relacionesValidas_Aux2 ((x,y):xs) | length ((x,y):xs) == 1 = True
                                  | not (elem (x,y) xs) = relacionesValidas_Aux2 xs
                                  | otherwise = False

--Ejercicio 2--
listaTodasPersonas :: (Eq t) => [(t,t)] -> [t]
listaTodasPersonas [] = []
listaTodasPersonas ((x,y):xs) | length ((x,y):xs) == 1 = [x] ++ [y]
                              | otherwise = [x] ++ [y] ++ listaTodasPersonas xs

quitarRepetidos :: (Eq t) => t -> [t] -> [t]
quitarRepetidos j (x:xs) | length (x:xs) == 1 && j == x = []
                         | length (x:xs) == 1 && j /= x = [x]
                         | j == x = quitarRepetidos j xs
                         | otherwise = x : quitarRepetidos j xs

quitarTodosRepetidos :: (Eq t) => [t] -> [t]
quitarTodosRepetidos (x:xs) | length (x:xs) == 1 = [x]
                            | not (elem x xs) = x : quitarTodosRepetidos xs
                            | otherwise = quitarTodosRepetidos(x : quitarRepetidos x xs)

personas :: (Eq t) => [(t,t)] -> [t]
personas [] = []
personas ((x,y):xs) = quitarTodosRepetidos(listaTodasPersonas ((x,y):xs))

--Ejercicio 3--
todosRelacionadosDeJ :: (Eq t) => t -> [(t,t)] -> [(t,t)]
todosRelacionadosDeJ j ((x,y):xs) | length ((x,y):xs) == 1 && (j == x || j == y) = [(x,y)]
                                  | length ((x,y):xs) == 1 && (j /= x && j /= y) = []
                                  | j == x || j == y = (x,y) : todosRelacionadosDeJ j xs
                                  | otherwise = todosRelacionadosDeJ j xs

amigosDe :: (Eq t) => t -> [(t,t)] -> [t]
amigosDe j [] = []
amigosDe j ((x,y):xs) = quitarRepetidos j (listaTodasPersonas(todosRelacionadosDeJ j ((x,y):xs)))

--Ejercicio 4--
compararCantidadDeRelaciones :: (Eq t) => t -> [t] -> [(t,t)] -> t
compararCantidadDeRelaciones j (x:xs) ((a,b):as) | length (x:xs) == 1 && length(amigosDe j ((a,b):as)) >= length(amigosDe x ((a,b):as)) = j
                                                 | length (x:xs) == 1 && length(amigosDe j ((a,b):as)) < length(amigosDe x ((a,b):as)) = x
                                                 | length (amigosDe j ((a,b):as)) >= length (amigosDe x ((a,b):as)) = compararCantidadDeRelaciones j xs ((a,b):as)
                                                 | otherwise = compararCantidadDeRelaciones x xs ((a,b):as)

personaConMasAmigos :: (Eq t) => [(t,t)] -> t
personaConMasAmigos ((a,b):as) = compararCantidadDeRelaciones a (personas((a,b):as)) ((a,b):as)
