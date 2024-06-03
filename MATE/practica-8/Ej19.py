def agrupar_por_longitud(nombre_archivo: str) -> dict[int,int]:
    res: dict[int,int] = {}
    archivo = open(nombre_archivo, "r")

    for line in archivo.readlines():
        longitud: int = 0
        for c in line:
            if c == " " or c == "\n":
                if longitud in res:
                    res[longitud] += 1
                else:
                    res[longitud] = 1
                longitud = 0
            else:
                longitud += 1

        if longitud != 0:
            if longitud in res:
                res[longitud] += 1
            else:
                res[longitud] = 1

    return res

print(agrupar_por_longitud("./data/test.txt"))

