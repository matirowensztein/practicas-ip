def clonar_sin_comentarios(nombre_archivo: str) -> None:
    archivo = open(nombre_archivo, "r")
    linea_actual = archivo.readline()
    nuevo_contenido = ""
    solo_espacios = True
    i = 0

    while linea_actual != "" and i < len(linea_actual):
        if linea_actual[i] == " " or linea_actual[i] == "\t":
            nuevo_contenido += linea_actual[i]
            i += 1
        if linea_actual[i] == "\n" or (linea_actual[i] == "#" and solo_espacios):
            nuevo_contenido += "\n"
            linea_actual = archivo.readline()
            solo_espacios = True
            i = 0
        else:
            nuevo_contenido += linea_actual[i]
            solo_espacios = False
            i += 1
        
    nuevo_nombre = ""
    i = 0
    while i < len(nombre_archivo):
        if nombre_archivo[i] == "." and nombre_archivo[i+1] != "/":
            nuevo_nombre += "_sin_espacios."
        else:
            nuevo_nombre += nombre_archivo[i]
        i += 1
    nuevo_archivo = open(nuevo_nombre, "w")
    nuevo_archivo.write(nuevo_contenido)



clonar_sin_comentarios("./Ej2.py")#jfdslk