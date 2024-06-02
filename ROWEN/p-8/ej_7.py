def calcular_promedio_por_estudiante(nombre_archivo_notas: str, nombre_archivo_promedios: str):
    arch = open(nombre_archivo_promedios, "w")
    arch.write(str(promedio_estudiante(nombre_archivo_notas, "3/24")))
    arch.close()

def promedio_estudiante(nombre_archivo: str, lu: str):
    palabra:str = ""
    es_alumno:bool = False
    notas:int = 0
    cant_notas: int = 0
    
    archivo = open(nombre_archivo, "r")
    lineas:list = archivo.readlines()
    
    for linea in lineas:
        for char in linea:
            if char == "," and palabra == lu:
                es_alumno = True
                palabra = ""
            elif char == ",":
                palabra = ""
            elif es_alumno and char == "\n":
                notas += float(palabra)
            else:
                palabra += char
                
        palabra = ""
        
        if es_alumno:
            cant_notas += 1
            es_alumno = False
            
    if cant_notas > 0:
        promedio = notas / cant_notas
    else:
        promedio = 0 
    
    return promedio
        
calcular_promedio_por_estudiante("p-8\\notas.csv","p-8\\promedio.csv")

