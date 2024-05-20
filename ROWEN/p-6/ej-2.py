import math

def imprimir_saludo(nombre: str):
    return (f"Hola {nombre}")
    
def raiz_cuadrada_de(num: int) -> float:
    return (round(math.sqrt(num), 4))
    
def fahrenheit_a_celsius(temp:float) -> float:
    return (((temp - 32) * 5)/9)

def imprimir_dos_veces(estribillo: str):
    return (estribillo*2)
    
def es_multiplo_de(n: int, m:int) -> bool:
    return n % m == 0

def es_par(n:int) -> bool:
    return n % 2 == 0

def cantidad_de_pizzas(comensales: int, min_cant_de_porciones: int) -> float:
    return math.ceil((comensales * min_cant_de_porciones) / 8)
    

print(cantidad_de_pizzas(1,2))