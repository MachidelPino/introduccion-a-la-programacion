from queue import LifoQueue as Pila
from queue import Queue as Cola
import random

#Ejercicio 1
#1.1
def contar_lineas(nombre_archivo: str) -> int:
    nombre_archivo = open(nombre_archivo, "r")
    lineas = nombre_archivo.readlines()
    i: int = 0
    
    for linea in lineas:
        i += 1
    
    nombre_archivo.close()
    return i

#1.2
def existe_palabra(palabra: str, nombreArchivo: str) -> bool:
    nombreArchivo = open(nombreArchivo, "r")
    lineas = nombreArchivo.readlines()
    existePalabra: bool = False
    
    for linea in lineas:
        palabrasEnLinea = linea.split()
        if palabra in palabrasEnLinea:
            existePalabra = True

    nombreArchivo.close()
    return existePalabra

#1.3
def cantidad_apariciones(nombre_archivo: str, palabra: str) -> int:
    nombre_archivo = open(nombre_archivo, "r")
    lineas = nombre_archivo.readlines()
    i: int = 0
    
    for linea in lineas:
        palabraEnLinea = linea.split()
        for palabr in palabraEnLinea:
            if(palabr == palabra):
                i += 1
    
    nombre_archivo.close()
    return i

#Ejercicio 2
def clonarSinComentarios(archivoComentado: str) -> str:
    archivoComentado = open(archivoComentado, 'r')
    destino = open("SinComentar.txt", 'w')
    lineasDelArchivo = archivoComentado.readlines()

    for linea in lineasDelArchivo:
        if((len(linea.strip()) == 0) or (not linea.strip()[0] == "#")):
            destino.write(linea)

    archivoComentado.close()
    destino.close()

#Ejercicio 3
def archivo_reverso(nombre_archivo: str) -> str:
    nombre_archivo = open(nombre_archivo, "r")
    reverso = open("reverso.txt", "w")
    lineas = nombre_archivo.readlines()
    
    while(not len(lineas) == 0):
        reverso.write(lineas[len(lineas)- 1])
        del lineas[(len(lineas) - 1)]
    
    nombre_archivo.close()
    reverso.close()

#Ejercicio 4
def agregarAlFinal(archivo: str, frase: str) -> str:
    archivo = open(archivo, "a")
    archivo.write("\n" + frase)
    archivo.close()

#Ejercicio 5
def agregarAlComienzo(nombre_archivo: str, frase: str):
    i: int = 0
    leerarchivo = open(nombre_archivo, "r")
    lineas = leerarchivo.readlines()
    leerarchivo.close()
    escribirarchivo = open(nombre_archivo, "w")
    escribirarchivo.write(frase + "\n")
    while(i < len(lineas)):
        escribirarchivo.write(lineas[i])
        i += 1
    escribirarchivo.close()

#Ejercicio 6
#def palabrasLegibles(nombre_archivo: str) -> [str]:
#    archivo = open(nombre_archivo, "b+r" )
#    print(archivo.read())
#    archivo.close()

#Ejercicio 7
def promedioEstudiante(nombre_archivo: str, lu: str) -> int:
    archivo = open(nombre_archivo, "r")
    lineas = archivo.readlines()
    alumno: str = ""
    for linea in lineas:
        if(lu in linea):
            alumno = linea.strip('"\n').split(",")
    i: int = len(alumno) - 1
    sumaNotas: float = 0
    cantidadDeNotas: int = 0
    while(i > 2):
        sumaNotas += float(alumno[i])
        i -= 1
        cantidadDeNotas += 1
    archivo.close()
    return (sumaNotas / cantidadDeNotas)


#Ejercicio 8
def generar_nros_al_azar(n: int, desde: int, hasta: int) -> Pila:
    i: int = n
    p = Pila()
    while(i > 0):
        p.put(random.randint(desde, hasta))
        i -= 1
    return p

#Ejercicio 9
def cantidad_elementos(p: Pila) -> int:
    return len(p.queue)



#Ejercicio 10
def buscar_el_maximo(p: Pila) -> int:
    maximo: int = p.get()
    
    while (not p.empty()):
        elemento: int = p.get()
        if elemento > maximo:
            maximo = elemento

    return maximo

#Ejercicio 11
def esta_bien_balanceada(s: str) -> bool:
    sinEspacios: str = s.replace(" ", "")
    if(operadores_balanceados(sinEspacios) and parentesis_balanceados(sinEspacios)):
        return True
    else:
        return False

def operadores_balanceados(f: str) -> bool:
    i: int = 0
    while(i < len(f)):
        if(f[i] == "+" or f[i] == "-" or f[i] == "x" or f[i] == "/"):
            if(f[i + 1] == "+" or f[i + 1] == "-" or f[i + 1] == "x" or f[i + 1] == "/"):
                return False
            else:
                i += 1
        else:
            i += 1
    return True

def parentesis_balanceados(f: str) -> bool:
    p = Pila()
    for i in f:
        if(i == "("):
            p.put(i)
        elif(i == ")"):
            if(p.empty()):
                return False
            else:
                p.get()
    if(p.empty()):
        return True
    else:
        return False
    
#Ejercicio 12
def evaluar_en_notacion_postfix(f: str) -> int:
    pila = Pila()
    formulaEnTerminos: [str] = f.split(" ")
    num1: int = 0
    num2: int = 0
    res: int = 0
    for i in formulaEnTerminos:
        if(i == "+"):
            num1 = pila.get()
            num2 = pila.get()
            res = num1 + num2
            pila.put(res)
        elif(i == "-"):
            num1 = pila.get()
            num2 = pila.get()
            res = num2 - num1
            pila.put(res)
        elif(i == "*"):
            num1 = pila.get()
            num2 = pila.get()
            res = num1 * num2
            pila.put(res)
        elif(i == "/"):
            num1 = pila.get()
            num2 = pila.get()
            res = num2 / num1
            pila.put(res)
        else:
            pila.put(int(i))
    return pila.get()

#Ejercicio 13
def cola_al_azar(n: int, desde: int, hasta: int) -> Cola:
    cola = Cola()
    i: int = n
    pila = generar_nros_al_azar(n, desde, hasta)
    while(not pila.empty()):
        cola.put(pila.get())
    return cola

#Ejercicio 14
def cantidad_elementos(c: Cola) -> int:
    return len(c.queue)

#Ejercicio 15
def buscar_el_maximo(c: Cola) -> int:
    print(c.queue)
    cola = c
    maximo: int = 0
    while(not cola.empty()):
        elemento: int = cola.get()
        if(elemento > maximo):
            maximo = elemento
    return maximo

#Ejercicio 16
def armar_secuencia_de_bingo() -> Cola:
    numeros0_99: list = []
    cola = Cola()
    i: int = 0
    while i <= 99:
        numeros0_99.append(i)
        i += 1
    random.shuffle(numeros0_99)
    for i in numeros0_99:
        cola.put(i)
    
    return cola

def jugar_carton_de_bingo(carton: list, bolillero: Cola) -> int:
    print(carton)
    print(bolillero.queue)
    carton1: list = carton
    bolillero1: Cola = bolillero
    bolillaA_Sacar: int = 0
    jugadas: int = 0
    while(len(carton1) > 0):
        bolillaA_Sacar = bolillero1.get()
        jugadas += 1
        if(bolillaA_Sacar in carton1):
            carton1.remove(bolillaA_Sacar)
    return jugadas

#Ejercicio 17
def n_pacientes_urgentes(c: Cola[int, str, str]) -> int:
    cola = c
    pacientesUrgentes: int = 0
    urgenciaPaciente: int = 0
    while(not cola.empty()):
        paciente = cola.get()
        urgenciaPaciente = paciente[0]
        if(urgenciaPaciente < 4):
            pacientesUrgentes += 1
    return pacientesUrgentes

#Ejercicio 18
def atencion_a_clientes(c: Cola[str, int, bool, bool]) -> Cola[str, int, bool, bool]:
    cola = c
    colaSinprioridad = Cola()
    colaSinPreferencial = Cola()
    colaOrdenada = Cola()
    cliente: (str, int, bool, bool) = ()
    while(not cola.empty()):
        cliente = cola.get()
        if(cliente[3]):
            colaOrdenada.put(cliente)
        else:
            colaSinprioridad.put(cliente)
    while(not colaSinprioridad.empty()):
        cliente = colaSinprioridad.get()
        if(cliente[2]):
            colaOrdenada.put(cliente)
        else:
            colaSinPreferencial.put(cliente)
    while(not colaSinPreferencial.empty()):
        cliente = colaSinPreferencial.get()
        colaOrdenada.put(cliente)
    return colaOrdenada

#Ejercicio 19
def agrupar_por_longitud(nombre_archivo: str) -> dict:
    archivo = open(nombre_archivo, "r")
    res = dict()
    lineas = archivo.readlines()
    for linea in lineas:
        palabras = linea.split(" ")
        for palabra in palabras:
            if(len(palabra) in res):
                res[len(palabra)] += 1
            else:
                res[len(palabra)] = 1
    archivo.close()
    return res

#Ejercicio 20
def promedioEstudianteDiccionario(nombre_archivo: str) -> dict:
    archivo = open(nombre_archivo, "r")
    lineas = archivo.readlines()
    alumno: str = ""
    dicc = dict()
    for linea in lineas:
        alumno = linea.strip('\n"').split(",")
        dicc[alumno[0]] = round(promedioEstudiante(nombre_archivo, alumno[0]), 2)
    archivo.close()
    return dicc

#Ejercicio 21
def la_palabra_mas_frecuente(nombre_archivo: str) -> str:
    dicc = dict()
    archivo = open(nombre_archivo, "r")
    lineas = archivo.readlines()
    todasPalabras: [str] = []
    i: int = 0
    for linea in lineas:
        palabras = linea.strip('\n"').split()
        for palabra in palabras:
            todasPalabras.append(palabra)
            if(palabra in dicc):
                dicc[palabra] += 1
            else:
                dicc[palabra] = 1
    longitud: int = len(todasPalabras) - 1
    maximo: str = todasPalabras[0]
    todasPalabras.pop(0)
    while(i < longitud):
        elemento: str = todasPalabras[0]
        todasPalabras.pop(0)
        if(dicc[elemento] > dicc[maximo]):
            maximo = elemento
            i += 1
        else:
            i += 1
    return maximo

#Ejercicio 22
historiales: dict = {}

def visitar_sitio(dicc: dict[str, (Pila, Pila)], usuario: str, sitio: str):
    if(usuario in dicc):
        dicc[usuario][0].put(sitio)
    else:
        dicc[usuario] = (Pila(), Pila())
        dicc[usuario][0].put(sitio)

def navegar_atras(dicc: dict[str, (Pila, Pila)], usuario: str):
    sitio: str = ""
    sitio = dicc[usuario][0].get()
    dicc[usuario][1].put(sitio)

def navegar_adelante(dicc: dict[str, (Pila, Pila)], usuario: str):
    sitio: str = ""
    sitio = dicc[usuario][1].get()
    dicc[usuario][0].put(sitio)


#En los ejercicios de manejo de archivos, faltan los archivos previos al ejercicio 4

"""
1.1
print(contar_lineas("archivo_palabras.txt"))
1.2
print(existe_palabra("Hola", "archivo_palabras.txt"))
print(existe_palabra("probar", "archivo_palabras.txt"))
print(existe_palabra("Probar", "archivo_palabras.txt"))
1.3
print(cantidad_apariciones("archivo_palabras.txt", "prueba"))
print(cantidad_apariciones("archivo_palabras.txt", "que"))
print(cantidad_apariciones("archivo_palabras.txt", "hola"))
2.0
clonarSinComentarios(archivoComentado)
3.0
archivo_reverso("archivo_palabras.txt")
4.0
agregarAlFinal("Ejercicio4.txt", "Ooh, ooh, and she's buying a stairway to Heaven")
5.0
agregarAlComienzo("Ejercicio5.txt", "How I wish, how I wish you were here")
6.0
Sin hacer, no se entiende bien
7.0
print(promedioEstudiante("Ejercicio7.csv", "699/22"))
print(promedioEstudiante("Ejercicio7.csv", "1263/23"))
print(promedioEstudiante("Ejercicio7.csv", "867/22"))
8.0
print(generar_nros_al_azar(5, 0, 10).queue)
9.0
print(cantidad_elementos(generar_nros_al_azar(10, 1, 10)))
10.0
print(buscar_el_maximo(pila))
11.0
print(esta_bien_balanceada(" 1 + (2 x 3 - ( 2 0 / 5 ))"))
print(esta_bien_balanceada("(1 + ) 2 x 3 ( ( )"))
12.0
print(evaluar_en_notacion_postfix("3 4 + 5 * 2 -"))
print(evaluar_en_notacion_postfix("9 4 / 1 +"))
13.0
print(cola_al_azar(10, 1, 10).queue)
14.0
print(cantidad_elementos(cola_al_azar(10, 1, 10)))
15.0
print(buscar_el_maximo(generar_nros_al_azar(5, 1 ,10)))
16.0
print(jugar_carton_de_bingo([2, 4, 1, 99 , 0 ,54 ,13 ,24 ,65 ,78 ,96, 47], armar_secuencia_de_bingo()))
17.0
cola1 = Cola()
cola1.put((1, "Marcos", "Otorrino"))
cola1.put((4, "Jennifer", "Otorrino"))
cola1.put((2, "Benjamin", "Otorrino"))
print(n_pacientes_urgentes(cola1))
18.0
cola18 = Cola()
cola18.put(("Federico", 44000555, True, False))
cola18.put(("Jose", 43685620, False, True))
cola18.put(("Benjamin", 45070355, True, True))
cola18.put(("Marcos", 43729803, False, False))
cola18.put(("Jennifer", 43685620, False, True))
print(atencion_a_clientes(cola18).queue)
19.0
print(agrupar_por_longitud("Ejercicio19.txt"))
20.0
print(promedioEstudianteDiccionario("Ejercicio7.csv"))
21.0
print(la_palabra_mas_frecuente("Ejercicio21.txt"))
22.0
visitar_sitio(historiales, "Usuario1", "google.com")
print("Usuario1", historiales["Usuario1"][0].queue)
print("Usuario1", historiales["Usuario1"][1].queue)
visitar_sitio(historiales, "Usuario1", "facebook.com")
print("Usuario1", historiales["Usuario1"][0].queue)
print("Usuario1", historiales["Usuario1"][1].queue)
navegar_atras(historiales, "Usuario1")
print("Usuario1", historiales["Usuario1"][0].queue)
print("Usuario1", historiales["Usuario1"][1].queue)
visitar_sitio(historiales, "Usuario2", "youtube.com")
print("Usuario1", historiales["Usuario1"][0].queue)
print("Usuario1", historiales["Usuario1"][1].queue)
print("Usuario2", historiales["Usuario2"][0].queue)
print("Usuario2", historiales["Usuario2"][1].queue)
navegar_adelante(historiales, "Usuario1")
print("Usuario1", historiales["Usuario1"][0].queue)
print("Usuario1", historiales["Usuario1"][1].queue)
print("Usuario2", historiales["Usuario2"][0].queue)
print("Usuario2", historiales["Usuario2"][1].queue)
23.0

"""