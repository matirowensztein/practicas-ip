def ingreso_nombres() -> list[str]:
    nombres: list[str] = []
    ingreso_valido:bool = True
    
    print("Ingrese los nombres de los estudiantes:")
    
    while ingreso_valido:
        nombre: str = input("- ")
        if nombre != "listo":
            nombres.append(nombre)
        else:
            ingreso_valido = False
        
    return nombres

print(ingreso_nombres())