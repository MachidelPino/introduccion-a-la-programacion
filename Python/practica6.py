import math

#Ejercicio 1.1
def imprimir_hola_mundo():
    print("Hola Mundo")

#Ejercicio 1.2
def imprimir_un_verso():
    print("Hola Mundo" 
        " Hola Mundo")

#Ejercicio 1.3
def raizDe2():
    return round(math.sqrt(2), 4)

#Ejercicio 1.4
def factorial_de_dos() -> int :
    return math.factorial(2)

#Ejercicio 1.5
def perimetro() -> float :
    res:float = 2*math.pi
    return res

#Ejercicio 2.1
def imprimir_saludo(nombre: str) :
    print ("Hola " + nombre)

#Ejercicio 2.2
def raiz_cuadrada_de(num: int) :
    print (math.sqrt(num))

#Ejercicio 2.3
def fahrenheit_a_celsius(t: float) -> float :
    res: float = ((t - 32) * 5 / 9)
    return res

#Ejercicio 2.4
def imprimir_dos_veces(estribillo: str):
    print (estribillo * 2)

#Ejercicio 2.5
def es_multiplo_de1(n: int, m: int) -> bool :
    return (n%m)==0

def es_multiplo_de2(n: int, m: int) -> bool :
    if (n%m==0):
        return True
    else:
        return False

#Ejercicio 2.6
def es_par(num: int):
    return es_multiplo_de1(num, 2)

#Ejercicio 2.7
def cantidad_de_pizzas(comensales: int, min_cant_de_porciones: int):
    total_porciones: int = comensales * min_cant_de_porciones
    if(total_porciones%8 == 0):
        return total_porciones // 8
    else:
        return total_porciones // 8 + 1

#Ejercicio 3.1
def alguno_es_0(numero1: int, numero2: int):
    return (numero1 == 0 or numero2 == 0)

#Ejercicio 3.2
def ambos_son_0(numero1: int, numero2: int):
    return (numero1 == 0 and numero2 == 0)

#Ejercicio 3.3
def es_nombre_largo(nombre: str) -> bool :
    return ((len(nombre) >= 3) & (len(nombre) <= 8))

#Ejercicio 3.4
def es_bisiestro(año: int):
    return (año%4 == 0 and año%100 != 0)

#Ejercicio 4
def peso_pino(altura: int):
    if(altura <= 3):
        return altura*100*3
    else:
        return 900 + (altura - 3) * 100 * 2

def es_peso_util(peso: int):
    return (peso >= 400) & (peso <= 1000)

def sirve_pino(altura: int):
    return es_peso_util(peso_pino(altura))

#Ejercicio 5.1
def devolver_el_doble_si_es_par(un_numero: int) :
    if(un_numero%2 == 0):
        return 2*un_numero
    else:
        return un_numero

#Ejercicio 5.2
def devolver_valor_si_es_par_sino_el_que_sigue(numero: int) :
    if(numero%2 == 0):
        return numero
    else:
        return numero + 1

#Ejercicio 5.3
def devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9_1(numero: int):
    if(numero%3 == 0):
        if(numero%9 == 0):
            return numero * 3
        else:
            return numero * 2
    else:
        return numero

def devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9_2(numero: int):
    if(numero%3 == 0) & (numero%9 != 0):
        return numero * 2
    if(numero%3 != 0) & (numero%9 != 0):
        return numero
    else:
        return numero * 3

#Ejercicio 5.4
def lindo_nombre(nombre: str):
    if(len(nombre) < 5):
        return ("Tu nombre tiene menos de 5 caracteres")
    else:
        return ("Tu nombre tiene muchas letras!")

#Ejercicio 5.5
def elRango(numero: int):
    if(numero < 5):
        return ("Menor a 5")
    if(numero > 20):
        return ("Mayor a 20")
    if(numero > 10 & numero < 20):
        return ("Entre 10 y 20")

#Ejercicio 5.6
def vacaciones_o_trabaja(sexo: str, edad: int):
    if(edad < 18):
        return ("Andá de vacaciones")
    elif(sexo == "M"):
        if(edad >= 65):
            return ("Andá de vacaciones")
        else:
            return ("Te toca trabajar")
    else:
        if(edad >= 60):
            return ("Andá de vacaciones")
        else:
            return ("Te toca trabajar")

#Ejercicio 6.1
def uno_diez():
    i: int = 1
    while(i <= 10):
        print (i)
        i += 1

#Ejercicio 6.2
def numeros_pares() :
    i: int = 10
    while(i <= 40):
        if(es_multiplo_de1(i, 2)):
            print (i)
        i += 1

#Ejercicio 6.3
def  diez_eco():
    i: int = 1
    while(i <= 10):
        print ("eco")
        i += 1

#Ejercicio 6.4
def cuenta_regresiva(i: int):
    while(i > 0):
        print (i)
        i -= 1
    print ("Despegue")

#Ejercicio 6.5
def viaje_en_el_tiempo(partida: int, llegada: int):
    while(partida > llegada):
        print ("Viajo un año al pasado, estamos en el año " + str(partida - 1))
        partida -= 1

#Ejercicio 6.6
def viaje_hasta_Aristoteles(partida: int):
    while(partida > -384):
        if(partida > 0):
            print("Viajo 20 años al pasado, estamos en el año " + str(partida - 20))
            partida -= 20
        else:
            print("Viajo 20 años al pasado, estamos en el año " + str((-1)*(partida - 20)) + "a.C.")
            partida -= 20

#Ejercicio 7
def uno_diez7():
    x = range(10)
    for i in x:
        print (i + 1)

def numeros_pares7():
    x = range(10, 41, 2)
    for i in x:
        print (i)

def diez_eco7():
    x = range(10)
    for i in x:
        print ("eco")

def cuenta_regeresiva7(j: int):
    x = range(j, 0, -1)
    for i in x:
        print(i)
    print("Despegue")

def viaje_en_el_tiempo7(partida: int,llegada: int):
    x = range(partida - 1, llegada - 1, -1)
    for i in x:
        print("Viajo un año al pasado, estamos en el año " + str(i))

def viaje_hasta_Aristoteles7(partida: int):
    x = range(partida - 20, -384, -20)
    for i in x:
        if(i >= 0):
            print("Viajo 20 años al pasado, estamos en el año " + str(i))
        else:
            print("Viajo 20 años al pasado, estamos en el año " + str((-1)*i) + " a.C.")

#Ejercicio 8.1
"""
x = 5
print(x)
y = 7
print(y)
x = x + y
print(x)
"""

#Ejercicio 8.2
"""
x = 5
print(x)
y = 7
print(y)
z = x + y
print(z)
y = z * 2
print(y)
"""

#Ejercicio 8.3
"""
x = 5
print(x)
y = 7
print(y)
x = "hora"
print(x)
y = x * 2
print(y)
"""

#Ejercicio 8.4
"""
x = False
print(x)
res = not(x)
print(res)
"""

#Ejercicio 8.5
"""
x = True
print(x)
y = False
print(y)
res = x and y
print(res)
x = res and x
print(x)
"""

#Ejercicio 9
def rt(x: int, g: int) -> int:
    g = g + 1
    return x + g

g: int = 0
def ro(x: int) -> int:
    global g
    g = g + 1
    return x + g

#9.1
"""
print(ro(1))
print(ro(1))
print(ro(1))
"""

#9.2
"""
print(rt(1, 0))
print(rt(1, 0))
print(rt(1, 0))
"""

#9.3
#Ejecucion simbolica

#9.4
#Especificacion

"""
1.1
 imprimir_hola_mundo()
1.2
 imprimir_un_verso()
1.3
 print (raizDe2())
1.4
 print (factorial_de_dos())
1.5
 print (perimetro())
2.1
 imprimir_saludo("Marcos")
2.2
 raiz_cuadrada_de(144)
2.3
 print (fahrenheit_a_celsius(100))
2.4
 imprimir_dos_veces("Hola Mundo")
2.5
 print (es_multiplo_de1(4,2))
 print (es_multiplo_de1(5,7))
 print (es_multiplo_de2(4,2))
 print (es_multiplo_de2(5,7))
2.6
 print (es_par(40))
 print (es_par(15))
2.7
 print (cantidad_de_pizzas(5,3))
3.1
 print (alguno_es_0(2,3))
 print (alguno_es_0(0,3))
 print (alguno_es_0(2,0))
 print (alguno_es_0(0,0))
3.2
 print (ambos_son_0(2,3))
 print (ambos_son_0(0,3))
 print (ambos_son_0(2,0))
 print (ambos_son_0(0,0))
3.3
 print (es_nombre_largo("Hola Mundo"))
3.4
 print (es_bisiestro(404))
 print (es_bisiestro(400))
4.0
 print (peso_pino(2))
 print (peso_pino(5))
 print (es_peso_util(peso_pino(2)))
 print (es_peso_util(peso_pino(5)))
 print (sirve_pino(2))
 print (sirve_pino(5))
5.1
 print (devolver_el_doble_si_es_par(20))
 print (devolver_el_doble_si_es_par(35))
5.2
 print (devolver_valor_si_es_par_sino_el_que_sigue(40))
 print (devolver_valor_si_es_par_sino_el_que_sigue(0))
 print (devolver_valor_si_es_par_sino_el_que_sigue(45))
5.3
 print (devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9_1(17))
 print (devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9_1(21))
 print (devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9_1(27))
 print (devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9_2(17))
 print (devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9_2(21))
 print (devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9_2(27))
5.4
 print (lindo_nombre("Marcos"))
 print (lindo_nombre("Jeni"))
5.5
 print (elRango(4))
 print (elRango(15))
 print (elRango(25))
 print (elRango(8)) 
5.6
 print (vacaciones_o_trabaja("M",70))
 print (vacaciones_o_trabaja("F",70))
 print (vacaciones_o_trabaja("M",50))
 print (vacaciones_o_trabaja("F",50))
 print (vacaciones_o_trabaja("M",15))
 print (vacaciones_o_trabaja("F",15))
6.1
 uno_diez()
6.2
 numeros_pares()
6.3
 diez_eco()
6.4
 cuenta_regresiva(0)
 cuenta_regresiva(5)
 cuenta_regresiva(10)
6.5
 viaje_en_el_tiempo(2000, 1990)
6.6
 viaje_hasta_Aristoteles(40)
7
 uno_diez7()
 numeros_pares7()
 diez_eco7()
 cuenta_regeresiva7(10)
 viaje_en_el_tiempo7(2000, 1990)
 viaje_hasta_Aristoteles7(40)
"""