from ej_7 import promedio_estudiante 

def calcular_promedio_por_estudiante(nombre_archivo_notas: str):
    diccionario = {}
    lu:str = ""
    tengo_lu:bool = False
    
    arch = open(nombre_archivo_notas, "r")
    lineas:list = arch.readlines()
    
    for linea in lineas:
        for char in linea:
            if not tengo_lu:
                if char == ",":
                    diccionario[lu] = 0
                    tengo_lu = True
                else:
                    lu += char
                    
        diccionario[lu] = promedio_estudiante("p-8\\notas.csv",lu)
        
        lu = ""
        tengo_lu:bool = False
    
    return diccionario

print(calcular_promedio_por_estudiante("p-8\\notas.csv"))
