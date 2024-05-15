import math

def imprimir_saludo(nombre: str):
    print(f"Hola {nombre}")

def raiz_cuadrada_de(numero: int) -> float:
    return math.sqrt(numero)

def fahrenheit_a_celsius(t: float) -> float:
    return ((t - 32) * 5)/9

def imprimir_dos_veces(estribillo: str):
    print(estribillo*2)

def es_multiplo_de(n: int, m: int) -> bool:
    return n % m == 0

def es_par(n: int) -> bool:
    return es_multiplo_de(n, 2)

def cantidad_de_pizzas(comensales: int, min_cant_de_porciones: int) -> float:
    return math.ceil((comensales * min_cant_de_porciones) / 8)

