def la_palabra_mas_frecuencia(nombre_archivo: str) -> str:
    res: str = ""
    max_length: int = 0
    frecuencias: dict[str,int] = {}
    archivo = open(nombre_archivo, "r")

    for line in archivo.readlines():
        palabra: str = ""
        longitud: int = 0
        for c in line:
            if c == " " or c == "\n":
                if palabra in frecuencias:
                    frecuencias[palabra] += 1
                else:
                    frecuencias[palabra] = 1
                longitud = 0
                palabra = ""
            else:
                palabra += c
                longitud += 1

        if palabra in frecuencias:
            frecuencias[palabra] += 1
        else:
            frecuencias[palabra] = 1

    for clave, valor in frecuencias.items():
        if valor > max_length:
            res = clave

    return res

print(la_palabra_mas_frecuencia("./data/notas.csv"))

