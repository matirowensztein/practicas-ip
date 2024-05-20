def uno_al_diez():
    for x in range(10):
        print(x + 1)
        

def diez_al_cuarenta_pares():
    for x in range(10,40,2):
        print(x)
        
        
def eco_diez_veces():
    for x in range(10):
        print("eco")
        x += 1
        
def despegue_cohete(x:int):
    for x in range(x, 0, -1):
        print(x)
    print("Despegue")
    
    
def viaje_en_el_tiempo(salida:int, llegada:int):
     for salida in range(salida, llegada, -1):
        print(f"Viajó un año al pasado, estamos en el año: {salida - 1}")
        
viaje_en_el_tiempo(10,5)
        