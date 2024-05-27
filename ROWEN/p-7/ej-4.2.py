def movimientos_banco() -> list:
    movimientos: list = []
    ingreso_valido: bool = True

    print("Ingrese la operación y el monto.")

    while ingreso_valido:
        operacion: str = input("Operación: ")

        if operacion == "C" or operacion == "D":
            monto = int(input("Monto: "))
            movimientos.append((operacion, monto))
        elif operacion == "X":
            ingreso_valido = False
        else:
            print("Ingrese una operación valida.")

    return movimientos


print(movimientos_banco())
