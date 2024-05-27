def reverso() -> None:
    archivo = open("./data/test.txt", "r")
    linea_actual = archivo.readline()
    nuevo_contenido: str = ""
    i: int = 0

    while linea_actual != "":
        if linea_actual[-1] != "\n":
            linea_actual += "\n"
        if i == 0:
            copia = linea_actual
            linea_actual = ""
            for c in copia:
                if c != "\n":
                    linea_actual += c
        nuevo_contenido = linea_actual + nuevo_contenido
        linea_actual = archivo.readline()
        i += 1

    archivo.close()
    nuevo_archivo = open("./data/reverso.txt", "w")
    nuevo_archivo.write(nuevo_contenido)
    nuevo_archivo.close()

reverso()