from time import sleep


def rango1a10():
    i: int = 1

    while (i <= 10):
        print(i)
        i += 1

def rango1a40():
    i: int = 10

    while (i <= 40):
        print(i)
        i += 1

def ecoecoeco():
    i: int = 0

    while (i < 10):
        print("eco")
        i += 1

def despegue(n: int):
    i: int = n

    while (i > 0):
        print(i)
        sleep(1)
        i -= 1
    
    print("Despegue!")

def viaje_al_pasado(partida: int, llegada: int):
    i: int = partida

    while (i >= llegada):
        print(f"Viajo un año al pasado, estamos en el año {i}")
        i -= 1

def buscar_a_aristoteles(n: int):
    i: int = n

    while (i >= 365):
        print(f"Viajo un año al pasado, estamos en el año {i}")
        i -= 20

buscar_a_aristoteles(2034)
