def promedio_estudiante(lu: str) -> float:
    res: float = 0
    archivo = open("./data/notas.csv", "r")
    linea: str = archivo.readline()
    cant_notas: float = 0

    while linea != "":
        palabra: str = ""
        en_nombre: bool = True
        es_alumno = False
        for i, c in enumerate(linea):
            if c == "," and en_nombre and palabra == lu:
                en_nombre = False
                es_alumno = True
            elif c == ",":
                palabra = ""
            else:
                palabra += c
            if (c == "\n" or i == len(linea)-1) and es_alumno:
                res += float(palabra)
                cant_notas += 1

        linea = archivo.readline()

    archivo.close()
    
    if cant_notas == 0:
        cant_notas = 1

    return res / cant_notas

print(promedio_estudiante("3/24"))
print(promedio_estudiante("4/24"))
print(promedio_estudiante("5/24"))
print(promedio_estudiante("6/24"))
