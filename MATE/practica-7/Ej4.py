import random

def ingresarNombres() -> list[str]:
    nombres: list[str] = []

    print("Ingrese los nombres de los estudiantes:")
    while True:
        nombre: str = input("> ")
        if nombre == "listo":
            break
        nombres.append(nombre)
    
    return nombres

def ingresarNombres2() -> list[str]:
    nombres: list[str] = []

    print("Ingrese los nombres de los estudiantes:")
    nombre: str = input("> ")
    while nombre != "listo":
        nombres.append(nombre)
        nombre = input("> ")
    
    return nombres

def inputOperacion() -> str:
    print("Ingrese el tipo de operacion (C, D o X):")
    return input("> ")

def historialMonedero() -> list[tuple[str, int]]:
    historial: list[tuple[str, int]] = []

    operacion: str = inputOperacion()
    while operacion != "X":
        if operacion != "C" and operacion != "D":
            operacion = inputOperacion()
            continue
        print("Ingrese el monto de la operacion:")
        monto: str = int(input("> "))
        historial.append((operacion, monto))
        operacion = inputOperacion()
    
    return historial

def generarCarta() -> int:
    n: int = random.randint(1,10)
    # o bien n: int = random.choice([1,2,3,4,5,6,7,10,11,12])
    if n >= 8:
        n += 2
    return n

def sieteYMedio() -> list[int]:
    cartas: list[int] = []
    carta: int
    puntaje: float = 0

    while puntaje <= 7.5 and input("¿(C)arta o (P)lantarse? ") != "P":
        carta = generarCarta()
        cartas.append(carta)
        if carta < 8:
            puntaje += carta
        else:
            puntaje += 0.5

        print(f"La carta era {carta} y el puntaje actual es {puntaje}")
    
    if puntaje > 7.5:
        print("Perdiste")
    
    return cartas

print(sieteYMedio())

