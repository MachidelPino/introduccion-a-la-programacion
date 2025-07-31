def ultima_aparicion(s: [int], e: int) -> int:
    s1: [int] = s
    e1: int = e
    i: int = -1
    while(e1 in s1):
        i += 1
        s1.pop(0)
    return i

def elementos_exclusivos(s: [int], t: [int]) -> [int]:
    res: [int] = []
    for i in s:
        if(not (i in res) and not (i in t)):
            res.append(i)
    for j in t:
        if(not (j in res) and not (j in s)):
            res.append(j)
    return res

def contar_traducciones_iguales(ing: dict[str, str], ale: dict[str, str]) -> int:
    i: int = 0
    res: int = 0
    longitud: int = len(ing.keys())
    while(i < longitud):
        primerIng: (str, str) = ing.popitem()
        claveIng: str = primerIng[0]
        valor: str = primerIng[1]
        if(claveIng in ale):
            if(valor == ale[claveIng]):
                res += 1
                i += 1
            else:
                i += 1
    return res

def convertir_a_diccionario(lista: [int]) -> dict:
    res = dict()
    for i in lista:
        if(i in res):
            res[i] += 1
        else:
            res[i] = 1
    return res