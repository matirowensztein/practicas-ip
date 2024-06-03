from queue import Queue as Cola
import random

def generar_nros_al_azar(cantidad: int, desde: int, hasta: int) -> Cola:
    res = Cola()
    
    for _ in range(cantidad):
        res.put(random.randint(desde, hasta))

    return res

def armar_carton_de_bingo() -> list[int]:
    res: list[int] = []
    valores: list[int] = []

    for i in range(100):
        valores.append(i)

    for i in range(12):
        i: int = random.randint(0, len(valores) - 1)
        res.append(valores[i])
        valores.pop(i)

    return res

def armar_secuencia_de_bingo() -> Cola[int]:
    res: Cola[int] = Cola()
    valores: list[int] = []

    for i in range(100):
        valores.append(i)

    while len(valores) > 0:
        i: int = random.randint(0, len(valores) - 1)
        res.put(valores[i])
        valores.pop(i)

    return res

def jugar_carton_de_bingo(carton: list[int], bolillero: Cola[int]) -> int:
    res: int = 0
    numeros_restantes: int = 12
    copia_carton = carton.copy()
    bolillero_al_reves = Cola()

    while numeros_restantes > 0:
        bolilla: int = bolillero.get()
        bolillero_al_reves.put(bolilla)
        i: int = 0
        while i < len(copia_carton):
            if bolilla == copia_carton[i]:
                numeros_restantes -= 1
                copia_carton.pop(i)
            else:
                i += 1
        res += 1

    while not bolillero.empty():
        bolillero_al_reves.put(bolillero.get())

    while not bolillero_al_reves.empty():
        bolillero.put(bolillero_al_reves.get())
        
    return res

print(jugar_carton_de_bingo(armar_carton_de_bingo(), armar_secuencia_de_bingo()))
