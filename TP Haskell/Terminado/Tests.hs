module Tests where

import Test.HUnit
import Solucion

-- Casos de test
main = runTestTT todosLosTests

run1 = runTestTT testsuite1
run2 = runTestTT testsuite2
run3 = runTestTT testsuite3
run4 = runTestTT testsuite4
run5 = runTestTT testsuite5
run6 = runTestTT testsuite6
run7 = runTestTT testsuite7
run8 = runTestTT testsuite8
run9 = runTestTT testsuite9
run10 = runTestTT testsuite10

todosLosTests = test [testsuite1, testsuite2, testsuite3, testsuite4, testsuite5, testsuite6, testsuite7, testsuite8, testsuite9, testsuite10]

-- Ejercicio 1: nombresDeUsuarios
testsuite1 = test [
    "Caso a: sin usuarios" ~: (nombresDeUsuarios red0) ~?= [],
    
    "Caso b: con nombres" ~: (nombresDeUsuarios redA) ~?= ["Carlos","Ana","Roberto"],
    
    "Caso c: con nombres repetidos" ~: (nombresDeUsuarios redB) ~?= ["Carlos","Roberto","Juana","Mateo","Ana","Daniel"]
    ]

-- Ejercicio 2: amigosDe
testsuite2 = test [
    "Caso a: sin amigos" ~: (amigosDe redA usuario3) ~?= [],
    
    "Caso b: con amigos" ~: (amigosDe redB usuario3) ~?= [(2,"Ana"),(4,"Juana")]
    ]

-- Ejercicio 3: cantidadDeAmigos
testsuite3 = test [
    "Caso a: antisocial" ~: (cantidadDeAmigos redA usuario3) ~?= 0,
    
    "Caso b: tiene amistades" ~: (cantidadDeAmigos redB usuario1) ~?= 3
    ]

-- Ejercicio 4: usuarioConMasAmigos
testsuite4 = test [
    "Caso a: nulos amigos" ~: (usuarioConMasAmigos red0) ~?= (0,"Nadie"),

    "Caso b: empate de amigos" ~: (usuarioConMasAmigos redA) ~?= (1,"Carlos"),
    
    "Caso c: el más sociable" ~: (usuarioConMasAmigos redB) ~?= (1,"Carlos")
    ] 

-- Ejercicio 5: estaRobertoCarlos
testsuite5 = test [
    "Caso a: not Roberto Carlos" ~: (estaRobertoCarlos redB) ~?= False,
    
    "Caso b: Roberto Carlos" ~: (estaRobertoCarlos redC) ~?= True
    ] 

-- Ejercicio 6: publicacionesDe
testsuite6 = test [
    "Caso a: lista sin publicaciones" ~: (publicacionesDe redA usuario3) ~?= [],
    
    "Caso b: lista con publicaciones" ~: (publicacionesDe redB usuario2) ~?= [((2,"Ana"),"Hoy me dan los resultados del examen",[(1,"Carlos"),(3,"Roberto"),(4,"Juana")]),((2,"Ana"),"Hoy vamos a estar con Juana por el centro",[(4,"Juana")]),((2,"Ana"),"Recomiendenme algo para ver antes de dormir",[(5,"Mateo"),(4,"Juana"),(6,"Ana"),(7,"Daniel")])]
    ] 

-- Ejercicio 7: publicacionesQueLeGustanA
testsuite7 = test [
    "Caso a: usuario con cero likes" ~: (publicacionesQueLeGustanA redA usuario3) ~?= [],
    
    "Caso b: lista con publicaciones gustadas" ~: (publicacionesQueLeGustanA redB usuario4) ~?= [((2,"Ana"),"Hoy me dan los resultados del examen",[(1,"Carlos"),(3,"Roberto"),(4,"Juana")]),((3,"Roberto"),"Acabe de terminar Crimen y Castigo",[(1,"Carlos"),(5,"Mateo"),(4,"Juana"),(6,"Ana")]),((2,"Ana"),"Hoy vamos a estar con Juana por el centro",[(4,"Juana")]),((2,"Ana"),"Recomiendenme algo para ver antes de dormir",[(5,"Mateo"),(4,"Juana"),(6,"Ana"),(7,"Daniel")])]
    ] 

-- Ejercicio 8: lesGustanLasMismasPublicaciones
testsuite8 = test [
    "Caso a: sin gustos similares" ~: (lesGustanLasMismasPublicaciones redB usuario1 usuario2) ~?= False,
    
    "Caso b: de gustos afines" ~: (lesGustanLasMismasPublicaciones redB usuario5 usuario6) ~?= True
    ] 

-- Ejercicio 9: tieneUnSeguidorFiel
testsuite9 = test [
    "Caso a: sin seguidor fiel" ~: (tieneUnSeguidorFiel redB usuario4) ~?= False,
    
    "Caso b: con seguidor fiel" ~: (tieneUnSeguidorFiel redB usuario2) ~?= True
    ] 

-- Ejercicio 10: existeSecuenciaDeAmigos
testsuite10 = test [
    "Caso a: amigos desconectados" ~: (existeSecuenciaDeAmigos redB usuario1 usuario6) ~?= False,
    
    "Caso b: amigos interconectados" ~: (existeSecuenciaDeAmigos redB usuario1 usuario5) ~?= True
    ] 

-- Usuarios
usuario1 = (1, "Carlos")
usuario2 = (2, "Ana")
usuario3 = (3, "Roberto")
usuario4 = (4, "Juana")
usuario5 = (5, "Mateo")
usuario6 = (6, "Ana")
usuario7 = (7, "Daniel")
usuario8 = (8, "Sofia")
usuario9 = (9, "David")
usuario10 = (10, "Juana")
usuario11 = (11, "Lionel")
usuario12 = (12, "Paula")

-- Relaciones
relacion1_2 = (usuario1, usuario2)

relacion3_2 = (usuario3, usuario2)
relacion4_5 = (usuario4, usuario5)
relacion1_6 = (usuario1, usuario6)
relacion3_4 = (usuario3, usuario4)
relacion5_1 = (usuario5, usuario1)

relacion1_3 = (usuario1, usuario3)
relacion4_1 = (usuario4, usuario1)
relacion7_1 = (usuario7, usuario1)
relacion1_8 = (usuario1, usuario8)
relacion1_9 = (usuario1, usuario9)
relacion10_1 = (usuario10, usuario1)
relacion1_11 = (usuario1, usuario11)
relacion12_1 = (usuario12, usuario1)

-- Publicaciones
publicacion1_1 = (usuario1, "Esta semana hace calor", [usuario2])

publicacion2_1 = (usuario2, "Hoy me dan los resultados del examen", [usuario1, usuario3, usuario4])
publicacion3_1 = (usuario3, "Acabe de terminar Crimen y Castigo", [usuario1, usuario5, usuario4, usuario6])
publicacion4_1 = (usuario4, "Espero que esta semana llueva", [])
publicacion2_2 = (usuario2, "Hoy vamos a estar con Juana por el centro", [usuario4])
publicacion2_3 = (usuario2, "Recomiendenme algo para ver antes de dormir", [usuario5, usuario4, usuario6, usuario7])

-- Redes Sociales
red0 = ([],[],[])

usuariosA = [usuario1, usuario2, usuario3]
relacionesA = [relacion1_2]
publicacionesA = [publicacion1_1]
redA = (usuariosA, relacionesA, publicacionesA)

usuariosB = [usuario1, usuario2, usuario3, usuario4, usuario5, usuario6, usuario7]
relacionesB = [relacion1_2, relacion3_2, relacion4_5, relacion1_6, relacion3_4, relacion5_1]
publicacionesB = [publicacion1_1, publicacion2_1, publicacion3_1, publicacion4_1, publicacion2_2, publicacion2_3]
redB = (usuariosB, relacionesB, publicacionesB)

usuariosC = [usuario1, usuario2, usuario3, usuario4, usuario5, usuario6, usuario7, usuario8, usuario9, usuario10, usuario11, usuario12]
relacionesC = [relacion1_2, relacion1_3, relacion4_1, relacion5_1, relacion1_6, relacion7_1, relacion1_8, relacion1_9, relacion10_1, relacion1_11, relacion12_1]
publicacionesC = [publicacion1_1]
redC = (usuariosC, relacionesC, publicacionesC)