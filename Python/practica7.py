import array
import random
import numpy as np

#Ejercicio 1
#1.1
def pertenece1(s: list, e: int):
    for i in s:
        if(i == e):
            return True
    return False

def pertenece2(s: list, e: int) -> bool:
    return e in s

def pertenece3(s: list, e: int):
    i: int = 0
    while(0 < len(s)):
        if(i >= len(s)):
            return False
        elif(e == s[i]):
            return True
        else:
            i += 1

#1.2
def divideA_Todos(s: [int], e: int) -> bool:
    i: int = 0
    while(i < len(s)):
        if(s[i]%e == 0):
            i += 1
        else:
            return False
    return True

#1.3
def sumaTotalF(l: list):
    res: int = 0
    for i in l:
        res = res + i
    return res

def sumaTotalW(l: list):
    res: int = 0
    i: int = 0
    while(i < len(l)):
        res = res + l[i]
        i += 1
    return res

#1.4
def ordenados(s: [int]) -> bool:
    i: int = 0
    while(i < len(s) - 1):
        if(s[i] <= s[i + 1]):
            i += 1
        else:
            return False
    return True

#1.5
def palabra_larga(s: [str]) -> bool:
    i: int = 0
    res: bool = False
    while(i < len(s)):
        if(len(s[i]) > 7):
            res = True
            i += 1
        else:
            i += 1
    return res

#1.6
def texto_palindromo(texto: str) -> bool:
    textosinespacios: str = texto.replace(" ", "")
    textosincomas: str = textosinespacios.replace(",", "")
    textoalreves: str = ""
    i: int = len(textosincomas)
    while(i >= 1):
        textoalreves += textosincomas[i - 1]
        i -= 1
    if(textosincomas == textoalreves):
        return True
    else:
        return False

#1.7
def fortaleza_contraseña(contraseña: str) -> str:
    caracter: bool = False
    minuscula: bool = False
    mayuscula: bool = False
    numero: bool = False
    for i in contraseña:
        if(len(contraseña) >= 8):
            caracter = True
    for i in contraseña:
        if(i in list(map(chr, range(97, 123)))):
           minuscula = True
    for i in contraseña:
        if(i in list(map(chr, range(65, 91)))):
            mayuscula = True
    for i in contraseña:
        if(i in list(map(chr, range(48, 58)))):
            numero = True
    if(caracter == False):
        return ("ROJA")
    elif(caracter & minuscula & mayuscula & numero):
        return ("VERDE")
    else:
        return ("AMARILLA")

def lista_con_ceros(s: list) -> list:
    par: int = 0
    for i in s:
        if(par%2 == 0):
            s[par] = 0
            par += 1
        else:
            par += 1
    return s

def perteneceA_CadaUno(s: [[int]], e: int) -> [bool]:
    j: int = 0
    res: [bool] = []
    while(j < len(s)):
        res.append(pertenece2(s[j], e))
        j += 1
    return res

#1.8
def saldo_actual(historial: [(str, int)]) -> int:
    i: int = 0
    saldo: int = 0
    while(i < len(historial)):
        if(historial[i][0] == "I"):
            saldo += historial[i][1]
            i += 1
        else:
            saldo -= historial[i][1]
            i += 1
    return saldo

#1.9
def tres_vocales(palabra1: str):
    i: int = 0
    palabra: str = palabra1.lower()
    cantidadDeVocales: [str] = []
    while(i < len(palabra)):
        if(palabra[i] == "a" or palabra[i] == "e" or palabra[i] == "i" or palabra[i] == "o" or palabra[i] == "u"):
            if(not palabra[i] in cantidadDeVocales):
                cantidadDeVocales.append(palabra[i])
                i += 1
            else:
                i += 1
        else:
            i += 1

    if(len(cantidadDeVocales) >= 3):
        return True
    else:
        return False

#Ejercicio 2
#2.1
def colocar_ceros(lista: [int]) -> [int]:
    i: int = 0
    while(i < len(lista)):
        if(i%2 == 0):
            lista.pop(i)
            lista.insert(i, 0)
            i += 1
        else:
            i += 1
    return lista

#2.2
def colocar_ceros_enlista(lista: [int]) -> [int]:
    listaout: [int] = colocar_ceros(lista)
    return listaout

#2.3
def quitar_vocales(lista: [chr]) -> [chr]:
    listaSinVocales: [chr] = []
    i: int = 0
    while(i < len(lista)):
        if(lista[i] == "a" or lista[i] == "e" or lista[i] == "i" or lista[i] == "o" or lista[i] == "u"):
            i += 1
        else:
            listaSinVocales.append(lista[i])
            i += 1
    return listaSinVocales

#2.4
def reemplazarVocales(s: [chr]) -> [chr]:
    listaSinVocales: [chr] = []
    i: int = 0
    while(i < len(s)):
        if(s[i] == "a" or s[i] == "e" or s[i] == "i" or s[i] == "o" or s[i] == "u"):
            listaSinVocales.append("_")
            i += 1
        else:
            listaSinVocales.append(s[i])
            i += 1
    return listaSinVocales

#2.5
def daVueltaStr(s: [chr]) -> [chr]:
    sDadaVuelta: [chr] = []
    i: int = len(s) - 1
    while(i >= 0):
        sDadaVuelta.append(s[i])
        i -= 1
    return sDadaVuelta

#2.6
def eliminarRepetidos(s: [chr]) -> [chr]:
    sinRepetidos: [chr] = []
    i: int = 0
    while(i < len(s)):
        if(not s[i] in sinRepetidos):
            sinRepetidos.append(s[i])
            i += 1
        else:
            i += 1
    return sinRepetidos

#Ejercicio 3
def aprobado(notas: [int]) -> int:
    if(notasAprobadas(notas) and promedio(notas) >= 7):
        return 1
    elif(notasAprobadas(notas) and promedio(notas) <= 7):
        return 2
    else:
        return 3


def notasAprobadas(notas: [int]) -> bool:
    calificacion: bool = False
    for i in notas:
        if(i >= 4):
            calificacion = True
        else:
            return False
    return calificacion

def promedio(notas: [int]) -> int:
    i: int = 0
    sumaNotas: int = 0
    while(i < len(notas)):
        sumaNotas += notas[i]
        i += 1
    promedioFinal: int = sumaNotas / i
    return promedioFinal

#Ejercicio 4
#4.1
def listaDeAlumnos() -> [str]:
    lista: [str] = []
    nombre: str = ""
    print("Introduzca los nombres de sus alumnos, cuando finalice escriba la palabra listo")
    nombre = input()
    while(not nombre == "listo"):
        lista.append(nombre)
        nombre = input()

    print(lista)

#4.2
def historialMonedero() -> [(str, int)]:
    operacion: str = ""
    monto: int = 0
    lista: [(str, int)] = []
    while(not operacion == "X"):
        print("¿Que operacion desea realizar?")
        print("Para cargar creditos introduzca C")
        print("Para descontar creditos introduzca D")
        print("Para finalizar la simulacion introduzca X")
        operacion = input()
        if(operacion == "C"):
            print("¿Cual es el monto que desea cargar?")
            monto = int(input())
            lista.append((operacion, monto))
        elif(operacion == "D"):
            print("¿Cual es el monto que desea descontar?")
            monto = int(input())
            lista.append((operacion, monto))
        elif(operacion == "X"):
            print("El historial de su monedero electronico es el siguiente:")
            print(lista)

#4.3
def siete_Y_Medio() -> [int]:
    cartaASacar: int = 0
    sumaCartas: int = 0
    mazo: [int] = generarMazo()
    print(mazo)
    desicionJugador: str = ""
    historialDeCartas: [int] = []
    print("Tu primera carta es:")
    cartaASacar = mazo[0]
    sumaCartas += sumarCartas(cartaASacar)
    mazo.remove(cartaASacar)
    historialDeCartas.append(cartaASacar)
    print(cartaASacar)
    while(not desicionJugador == "Me planto"):
        if(sumaCartas > 7.5):
            print("Las cartas que sacaste son " + str(historialDeCartas))
            print("El valor de la suma de tus cartas es " + str(sumaCartas))
            print("Perdiste")
            break
        print("Si desea plantarse ingrese Me planto, si desea sacar otra carta presione enter")
        desicionJugador = input()
        if(desicionJugador == "Me planto"):
            print("Las cartas que sacaste son " + str(historialDeCartas))
            print("Tu resultado es " + str(sumaCartas))
            print("Ganaste")
        else:
            print("Su siguiente carta es: ")
            cartaASacar = mazo[0]
            sumaCartas += sumarCartas(cartaASacar)
            mazo.remove(cartaASacar)
            historialDeCartas.append(cartaASacar)
            print(cartaASacar)
            print("La suma de sus cartas es: ")
            print(sumaCartas)


def sumarCartas(carta: int) -> int:
    if(carta == 10 or carta == 11 or carta == 12):
        return 0.5
    else:
        return carta

def generarMazo() -> [int]:
    i: int = 1
    mazo: [int] = []
    while(i <= 12):
        if(i == 8 or i == 9):
            i += 1
        else:
            mazo.append(i)
            mazo.append(i)
            mazo.append(i)
            mazo.append(i)
            i += 1
    random.shuffle(mazo)
    return mazo

#Ejercicio 5
#5.1
def perteneceACadaUno(s: [[int]], e: int) -> [bool]:
    i: int = 0
    res: [bool] = []
    while(i < len(s)):
        if(pertenece2(s[i], e)):
            res.append(True)
            i += 1
        else:
            res.append(False)
            i += 1
    return res

#5.2
def esMatriz(s: [[int]]) -> bool:
    i: int = 0
    longituds0: int = len(s[0])
    res: bool = False
    while(i < len(s)):
        if(len(s[i]) == longituds0 and longituds0 != 0):
            res = True
            i += 1
        else:
            return False
    return res

#5.3
def filasOrdenadas(m: [[int]]) -> [bool]:
    i: int = 0
    res: [bool] = []
    while(i < len(m)):
        if(ordenados(m[i])):
            res.append(True)
            i += 1
        else:
            res.append(False)
            i += 1
    return res

#5.4
def matrizElevadaP(d: int, p: int) -> [[int]]:
    m = np.random.randint(1,9, (d,d)) ** p
    return m

"""
1.1
print(pertenece3([1,2,3,4],0))
print(pertenece3([1,2,3,4],3))
1.2
print(divideA_Todos([1,2,3,4], 2))
1.3
print(sumaTotalF([0,1,2,3]))
print(sumaTotalW([0,1,2,3]))
1.4
print(ordenados([1,2,3,4]))
print(ordenados([1,2,5,4]))
print(ordenados([]))
1.5
print(palabra_larga(["hola", "como", "estas"]))
print(palabra_larga(["hola", "como", "estas", "chauuuuuuu", "good", "like", "loop"]))
print(palabra_larga(["holaa", "como", "estas", "mañana", "va", "a", "hacer", "frio", "computadora"]))
1.6
print(texto_palindromo("hola como estas, espero que estes bien"))
print(texto_palindromo("ojo corre poco perro cojo"))
1.7
print(perteneceA_CadaUno([[1,2,3],[4,5,6],[7,8,9],[10,11,1]], 1))
print(lista_con_ceros([1,1,1,1,1,1]))
print(fortaleza_contraseña("holachaU8"))
1.8
print(saldo_actual([("I", 2000) ,("R", 20) ,("R", 1000) ,("I", 300)]))
1.9
print(tres_vocales("Marquitos"))
2.1
print(colocar_ceros([1,1,1,1,1,1,1,1,1,1,1,1,1]))
2.2
print(colocar_ceros_enlista([1,1,1,1,1,1,1,1]))
2.3
print(quitar_vocales(["a", "b", "c", "o", "e", "i", "g", "h"]))
2.4
print(reemplazarVocales(["a", "b", "c", "o", "e", "i", "g", "h"]))
2.5
print(daVueltaStr(["a", "e", "i", "o", "u"]))
2.6
print(eliminarRepetidos(["a", "e", "a", "o", "o", "o", "a", "a"]))
3
print(aprobado([1, 6, 7, 5, 1, 7, 9]))
4.1
listaDeAlumnos()
4.2
historialMonedero()
4.3
siete_Y_Medio()
5.1
print(perteneceACadaUno([[1,2,3,4,5,6],[3,4,5,6,7,8],[6,7,8,9,10,11],[9,10,11,12,13,14]], 6))
print(perteneceACadaUno([[1,2,3,4,5,6],[3,4,5,6,7,8],[6,7,8,9,10,11],[9,10,11,12,13,14]], 2))
print(perteneceACadaUno([[1,2,3,4,5,6],[3,4,5,6,7,8],[6,7,8,9,10,11],[9,10,11,12,13,14]], 8))
print(perteneceACadaUno([[1,2,3,4,5,6],[3,4,5,6,7,8],[6,7,8,9,10,11],[9,10,11,12,13,14]], 10))
print(perteneceACadaUno([[1,2,3,4,5,6],[3,4,5,6,7,8],[6,7,8,9,10,11],[9,10,11,12,13,14]], 13))
5.2
print(esMatriz([[1,2,3],[4,5,6],[2,4,6],[0,8,7]]))
print(esMatriz([[1,2,3],[4,5,6],[2,4,6],[0,8]]))
5.3
print(filasOrdenadas([[1,2,3,4,8],[1,2,35,4,80],[9,8,7,6,5],[1,24,56,78,152]]))
5.4
print(matrizElevadaP(10,2))
"""