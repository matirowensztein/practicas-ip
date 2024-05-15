from time import sleep


def rango1a10():
    for i in range(10):
        print(i + 1)

def rango1a40():
    for i in range(40):
        print(i + 1)

def ecoecoeco():
    for i in range(10):
        print("eco")
        i += 1

def despegue(n: int):
    for i in range(n, 0, -1):
        print(i)
        sleep(1)
    
    print("Despegue!")

def viaje_al_pasado(partida: int, llegada: int):
    for i in range(partida, llegada-1, -1):
        print(f"Viajo un año al pasado, estamos en el año {i}")

def buscar_a_aristoteles(n: int):
    for i in range(n, 366, -20):
        print(f"Viajo un año al pasado, estamos en el año {i}")
