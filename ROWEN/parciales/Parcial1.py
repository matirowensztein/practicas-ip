# Ejercicio 1
#
#  problema ultima_aparicion (s: seq⟨Z⟩, e: Z) : Z {
#    requiere: {e pertenece a s }
#    asegura: {res es la posición de la última aparición de e en s}
#  }

# Por ejemplo, dados
#   s = [-1,4,0,4,100,0,100,0,-1,-1]
#   e = 0
# se debería devolver res=7

def ultima_aparicion (s: list[int], e: int):
    cont: int = 0
    ult_pos: int = 0

    for i in s:
        if i != e:
            cont += 1
        else:
            ult_pos = cont
            cont += 1
    
    return ult_pos


print(ultima_aparicion([1,2,3,4,5,4,5],4))

# Ejercicio 2
#
#  problema elementos_exclusivos (s: seq⟨Z⟩, t: seq⟨Z⟩) : seq⟨Z⟩ {
#    requiere: -
#    asegura: {Los elementos de res pertenecen o bien a s o bien a t, pero no a ambas }
#    asegura: {res no tiene elementos repetidos }
#  }

# Por ejemplo, dados
#   s = [-1,4,0,4,3,0,100,0,-1,-1]
#   t = [0,100,5,0,100,-1,5]
# se debería devolver res = [3,4,5] ó res = [3,5,4] ó res = [4,3,5] ó res = [4,5,3] 
# ó res = [5,3,4] ó res = [5,4,3]

def pertenece(l, e):
    condicion: bool = False

    for i in l:
        if e == i:
            condicion = True

    return condicion
    
print(pertenece([1,2,3,4,5,4,5],7))

def elementos_exclusivos (s: list[int], t: list[int]):
    elems_unic: list = []

    for i in s:
        if not pertenece(t,i) and not pertenece(elems_unic,i):
            elems_unic.append(i)

    for k in t:
        if not pertenece(s,k) and not pertenece(elems_unic,k): 
            elems_unic.append(k)

    return elems_unic

print(elementos_exclusivos([-1,4,0,4,3,0,100,0,-1,-1],[0,100,5,0,100,-1,5]))

# Ejercicio 3
#
# Se cuenta con un diccionario que contiene traducciones de palabras del idioma castellano (claves) a palabras
# en inglés (valores), y otro diccionario que contiene traducciones de palabras en castellano (claves) a palabras
# en alemán (valores). Se pide escribir un programa que dados estos dos diccionarios devuelva la cantidad de 
# palabras que tienen la misma traducción en inglés y en alemán.

#  problema contar_traducciones_iguales (ing: dicc⟨String,String⟩, ale: dicc⟨String,String⟩) : Z {
#    requiere: -
#    asegura: {res = cantidad de palabras que están en ambos diccionarios y además tienen igual valor en ambos}
#  }

#  Por ejemplo, dados los diccionarios
#    aleman = {"Mano": "Hand", "Pie": "Fuss", "Dedo": "Finger", "Cara": "Gesicht"}
#    inglés = {"Pie": "Foot", "Dedo": "Finger", "Mano": "Hand"}
#  se debería devolver res=2


def contar_traducciones_iguales (ing: dict[(str,str)], ale: dict[(str,str)]):
    cont: int = 0
    for c in ing.keys():
        if pertenece(ale, c):
            if ing[c] == ale[c]:
                cont += 1

    return cont 

print(contar_traducciones_iguales({"Mano": "Hand", "Pie": "Foot", "Dedo": "Finger", "Cara": "Gesicht"},{"Pie": "Foot", "Dedo": "Finger", "Mano": "Hand"}))

# Ejercicio 4
#
# Dada una lista de enteros s, se desea devolver un diccionario cuyas claves sean los valores presentes en s, 
# y sus valores la cantidad de veces que cada uno de esos números aparece en s

#  problema convertir_a_diccionario (lista: seq⟨Z⟩) : dicc⟨Z,Z⟩) {
#    requiere: -
#    asegura: {res tiene como claves los elementos de lista y res[n] = cantidad de veces que aparece n en lista}
#  }

#  Por ejemplo, dada la lista
#  lista = [-1,0,4,100,100,-1,-1]
#  se debería devolver res={-1:3, 0:1, 4:1, 100:2}
#  
# RECORDAR QUE NO IMPORTA EL ORDEN DE LAS CLAVES EN UN DICCIONARIO

def convertir_a_diccionario (s: list[int]):
    diccionario:dict = {}

    for i in s:
        if pertenece(diccionario.keys(),i):
            cont_apar: int = 0
            cont_apar = diccionario[i] 
            diccionario[i] = cont_apar + 1
            cont_apar = 0
        else:
            diccionario[i] = 1

    return diccionario

print(convertir_a_diccionario([-1,0,4,100,100,-1,-1]))