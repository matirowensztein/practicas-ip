def promedio_estudiante(filename: str) -> dict[str,float]:
    res: dict[str,float] = {}
    cant: dict[str,float] = {}
    archivo = open(filename, "r")
    linea: str = archivo.readline()

    while linea != "":
        palabra: str = ""
        nombre: str = ""
        for i, c in enumerate(linea):
            if c == "," and nombre == "":
                nombre = palabra
                palabra = ""
            elif c == ",":
                palabra = ""
            else:
                palabra += c
            if c == "\n" or i == len(linea)-1:
                if nombre in res:
                    res[nombre] += float(palabra)
                    cant[nombre] += 1
                else:
                    res[nombre] = float(palabra)
                    cant[nombre] = 1

        linea = archivo.readline()

    archivo.close()

    for nombre in res.keys():
        res[nombre] = res[nombre] / cant[nombre]
    
    return res

print(promedio_estudiante("./data/notas.csv"))

