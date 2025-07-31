from queue import LifoQueue as Pila
import random

def generar_nros_al_azar(n : int, desde : int, hasta : int) -> Pila:
    pila = Pila()
    for i in range(0,n):
        pila.put(random.randint(desde,hasta))
    return pila.queue

print(generar_nros_al_azar(10,1,100))