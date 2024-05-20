def uno_al_diez():
    x: int = 1

    while (x <= 10):
        print(x)
        x += 1
        
def diez_al_cuarenta_pares():
    x: int = 10

    while (x <= 40):
        print(x)
        x += 2
        
def eco_diez_veces():
    x: int = 10

    while (x > 0):
        print("eco")
        x -= 1

def despegue_cohete(x:int):
    while (x >= 1):
        print(x)
        x -= 1
    print("Despegue")
    
def viaje_en_el_tiempo(salida:int, llegada:int):
    while (salida > llegada):
        print(f"Viajó un año al pasado, estamos en el año: {salida - 1}")
        salida -= 1
        
viaje_en_el_tiempo(10,5)