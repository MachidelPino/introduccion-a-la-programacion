#Ejercicio 1
"""Habia una forma mucho mas simple de hacerlo"""
def intercalar(s1: list, s2: list) -> list:
    lista1: list = s1
    lista2: list = s2
    i: int = 0
    j: int = 0
    m: int = 0
    res: list = []
    while(i < 2 * len(lista1)):
        if(i%2 == 0):
            res.append(lista1[m])
            m += 1
            i += 1
        else:
            res.append(lista2[j])
            j += 1
            i += 1
    return res


#Ejercicio 2 
def pos_nesima_aparicion(s: list, n: int, elem: int) -> int:
    s1: list = s
    n1: int = n
    elem1: int = elem
    res: int = 0
    contador: int = 0
    while(res < len(s1)):
        if(s1[res] == elem1):
            contador += 1
            if(contador == n1):
                return res
            else:
                res += 1
        else:
            res += 1
    if(contador < n1):
        return -1
    else:
        return res

#Ejercicio 3 
def matriz_espejada(m: list) -> bool:
    m1: list = m
    m2: list = []
    for i in m1:
        m2.append(dar_vuelta(i))
    if(m1 == m2):
        return True
    else:
        return False

def dar_vuelta(lista: list) -> list:
    long: int = len(lista) - 1
    res: list = []
    while(long >= 0):
        res.append(lista[long])
        long -= 1
    return res


#Ejercicio 4 
def cuenta_posiciones_por_caballo(caballos: list, carreras: dict) -> dict:
    res = dict()
    caballos1: list = caballos
    carreras1: dict = carreras
    todasCarreras: list = []
    cantidadDeCarreras: int = len(carreras1.values())
    while(cantidadDeCarreras > 0):
        cantidadDeCarreras -= 1
        carrera = carreras.popitem()[1]
        todasCarreras.append(carrera)
    for i in caballos1:
        posiciones: list = [0]*len(caballos)
        for car in todasCarreras:
            j: int = 0
            while(j < len(caballos)):
                if(car[j] == i):
                    posiciones[j] += 1
                    j = len(caballos)
                else:
                    j += 1
        res[i] = posiciones
    return res