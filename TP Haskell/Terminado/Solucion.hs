module Solucion where
-- Completar con los datos del grupo
--

type Usuario = (Integer, String) -- (id, nombre)
type Relacion = (Usuario, Usuario) -- usuarios que se relacionan
type Publicacion = (Usuario, String, [Usuario]) -- (usuario que publica, texto publicacion, likes)
type RedSocial = ([Usuario], [Relacion], [Publicacion])

-- Funciones basicas

usuarios :: RedSocial -> [Usuario]
usuarios (us, _, _) = us

relaciones :: RedSocial -> [Relacion]
relaciones (_, rs, _) = rs

publicaciones :: RedSocial -> [Publicacion]
publicaciones (_, _, ps) = ps

idDeUsuario :: Usuario -> Integer
idDeUsuario (id, _) = id 

nombreDeUsuario :: Usuario -> String
nombreDeUsuario (_, nombre) = nombre 

usuarioDePublicacion :: Publicacion -> Usuario
usuarioDePublicacion (u, _, _) = u

likesDePublicacion :: Publicacion -> [Usuario]
likesDePublicacion (_, _, us) = us

-- EJERCICIOS

-- EJERCICIO 1
-- Toma la lista de usuarios de la red social dada, y crea una nueva lista sólo con los nombres y sacando los repetidos.
nombresDeUsuarios :: RedSocial -> [String]
nombresDeUsuarios ([],_,_) = []
nombresDeUsuarios red = sacarRepetidosDeLista (proyectarNombres (usuarios red))

-- Toma la lista de usuarios, y extrae el nombre de cada uno, formando una nueva lista.
proyectarNombres :: [Usuario] -> [String]
proyectarNombres [] = []
proyectarNombres (u:us) = nombreDeUsuario u : proyectarNombres us

-- Recibe una lista de elementos, y devuelve la lista sin los elementos repetidos.
sacarRepetidosDeLista :: (Eq t) => [t] -> [t]
sacarRepetidosDeLista [] = []
sacarRepetidosDeLista (x:xs) | pertenece x xs == True = sacarRepetidosDeLista xs
                             | otherwise = x : sacarRepetidosDeLista xs

-- EJERCICIO 2
-- Devuelve una lista de usuarios de la red social, que tienen relación con el usuario dado.
amigosDe :: RedSocial -> Usuario -> [Usuario]
amigosDe red us = listarAmigosDe (relaciones red) us

-- Suma a la lista resultante los usuarios "amigos" del usuario especificado, sin importar en que tupla estén.
listarAmigosDe :: [Relacion] -> Usuario -> [Usuario]
listarAmigosDe [] _ = [] 
listarAmigosDe (r:rs) u | fst r == u = snd r : listarAmigosDe rs u
                        | snd r == u = fst r : listarAmigosDe rs u
                        | otherwise = listarAmigosDe rs u

-- EJERCICIO 3
-- Envía la lista de relaciones del usuario especificado a otra función, para que los cuente, y devuelve el número de relaciones del usuario especificado.
cantidadDeAmigos :: RedSocial -> Usuario -> Int
cantidadDeAmigos red us = contarAmigos (amigosDe red us)

-- Suma 1 por cada amigo de la lista, hasta contarlos todos.
contarAmigos :: [Usuario] -> Int
contarAmigos [] = 0
contarAmigos (u:us) = 1 + contarAmigos us

-- EJERCICIO 4
-- Envia la Red Social dada a otra función para comparar la cantidad de amigos de cada usuario, y devuelve el usuario que tenga un mayor número.
usuarioConMasAmigos :: RedSocial -> Usuario
usuarioConMasAmigos red | length (usuarios red) > 0 && length (relaciones red) > 0 = compararAmistades red (tail (usuarios red)) (head (usuarios red))
                        | otherwise = (0,"Nadie")

-- Contrasta la cantidad de amigos de cada usuario, y guarda al que más tenga; devolviendolo como resultado al final.
compararAmistades :: RedSocial -> [Usuario] -> Usuario -> Usuario
compararAmistades _ [] us = us
compararAmistades r (x:xs) us | (cantidadDeAmigos r us) >= (cantidadDeAmigos r x) = compararAmistades r xs us
                              | otherwise = compararAmistades r xs x

-- EJERCICIO 5
-- Devuelve True si el usuario con más amigos supera la cantidad de 10, y False si no lo hace.
estaRobertoCarlos :: RedSocial -> Bool
estaRobertoCarlos red = cantidadDeAmigos red (usuarioConMasAmigos red) > 10

-- EJERCICIO 6
-- Envía a otra función para hacer una lista de las publicaciones realizadas por el usuario especificado.
publicacionesDe :: RedSocial -> Usuario -> [Publicacion]
publicacionesDe red us = listarPublicacionesDe us (publicaciones red)

-- Hace una lista de las publicaciones realizadas por el usuario especificado.
listarPublicacionesDe :: Usuario -> [Publicacion] -> [Publicacion]
listarPublicacionesDe _ [] = []
listarPublicacionesDe us (p:ps) | us == usuarioDePublicacion p = p : listarPublicacionesDe us ps
                                | otherwise = listarPublicacionesDe us ps

-- EJERCICIO 7
-- Envía la Red Social y Usuario especificados a otra función para hacer una lista de las publicaciones "likeadas" por el usuario especificado.
publicacionesQueLeGustanA :: RedSocial -> Usuario -> [Publicacion]
publicacionesQueLeGustanA red us = listarPublicacionesGustadasPor us (publicaciones red)

-- Revisa cada publicación, y hace una lista con aquellas donde el usuario especificado dió un "like".
listarPublicacionesGustadasPor :: Usuario -> [Publicacion] -> [Publicacion]
listarPublicacionesGustadasPor _ [] = []
listarPublicacionesGustadasPor us (p:ps) | pertenece us (likesDePublicacion p) = p : listarPublicacionesGustadasPor us ps
                                         | otherwise = listarPublicacionesGustadasPor us ps

-- EJERCICIO 8
-- Verifica si los "likes" de ambos usuarios especificados recaen sobre las mismas publicaciones.
lesGustanLasMismasPublicaciones :: RedSocial -> Usuario -> Usuario -> Bool
lesGustanLasMismasPublicaciones red us1 us2 = mismosElementos (publicacionesQueLeGustanA red us1) (publicacionesQueLeGustanA red us2)

-- EJERCICIO 9
-- Verifica que la red social y el usuario sean "válidos", y que las publicaciones del usuario sean mayores a 0; luego envía a una función
-- para que verifique que existe un usuario que ha "likeado" todas las publicaciones del usuario especificado.
tieneUnSeguidorFiel :: RedSocial -> Usuario -> Bool
tieneUnSeguidorFiel red us = buscarSeguidorFielAlUsuario us red (usuarios red)

-- Verifica que las publicaciones del usuario especificado sean un subconjunto de las publicaciones "likeadas" por algún otro usuario.
buscarSeguidorFielAlUsuario :: Usuario -> RedSocial -> [Usuario] -> Bool
buscarSeguidorFielAlUsuario _ _ [] = False
buscarSeguidorFielAlUsuario us red (x:xs) | x /= us && esSubconjunto (publicacionesDe red us) (publicacionesQueLeGustanA red x) = True
                                          | otherwise = buscarSeguidorFielAlUsuario us red xs

-- EJERCICIO 10
-- Verifica que una secuencia de usuarios entre los dos usuarios especificados configure una cadena de amigos, es decir que cada usuario de la
-- secuencia esté relacionado con otro, desde el primero al último.
existeSecuenciaDeAmigos :: RedSocial -> Usuario -> Usuario -> Bool
existeSecuenciaDeAmigos red us1 us2 = cadenaDeAmigos (secuenciaEntreDosElementos us1 us2 (usuarios red)) red

-- Quita el primer elemento de una lista, recursivamente, hasta dar con el primer elemento dado; luego quita el último elemento de la lista,
-- también recursivamente, hasta dar con el segundo elemento dado. Devuelve como resultado la lista entre ambos elementos, incluyéndolos ambos.
secuenciaEntreDosElementos :: (Eq t) => t -> t -> [t] -> [t]
secuenciaEntreDosElementos e1 e2 [] = []
secuenciaEntreDosElementos e1 e2 l | empiezaCon e1 l && terminaCon e2 l = l
                                   | empiezaCon e1 l = secuenciaEntreDosElementos e1 e2 (quitarUltimoElemento l) 
                                   | otherwise = secuenciaEntreDosElementos e1 e2 (tail l)

-- Transcribe la lista entera de elementos, omitiendo el último.
quitarUltimoElemento :: (Eq t) => [t] -> [t]
quitarUltimoElemento (x:[]) = []
quitarUltimoElemento (x:xs) = x : quitarUltimoElemento xs

-- Predicados Auxiliares

pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece t (x:xs) = t == x || pertenece t xs

mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos [] [] = True
mismosElementos l1 l2 = esSubconjunto l1 l2 && esSubconjunto l2 l1

esSubconjunto :: (Eq t) => [t] -> [t] -> Bool
esSubconjunto [] _ = True
esSubconjunto (x:xs) l2 = pertenece x l2 && esSubconjunto xs l2

cadenaDeAmigos :: [Usuario] -> RedSocial -> Bool
cadenaDeAmigos us red | length us >= 2 = relacionadosDirecto us red
                      | otherwise = False

relacionadosDirecto :: [Usuario] -> RedSocial -> Bool
relacionadosDirecto (x:xs) red | xs == [] = True
                               | pertenece (x,head xs) (relaciones red) || pertenece (head xs,x) (relaciones red) = relacionadosDirecto xs red
                               | otherwise = False

empiezaCon :: (Eq t) => t -> [t] -> Bool
empiezaCon e l = head l == e

terminaCon :: (Eq t) => t -> [t] -> Bool
terminaCon e (l:[]) = e == l
terminaCon e (l:ls) = terminaCon e ls