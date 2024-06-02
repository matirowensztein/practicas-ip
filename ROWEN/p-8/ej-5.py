def archivo_reverso(nombre_archivo:str, frase:str):
    arch = open(nombre_archivo, "r")
    cont_original = arch.read()
    arch = open(nombre_archivo, "w")
    arch.write(frase + "\n" + cont_original)
    arch.close()

archivo_reverso("p-8\\reverso.txt","Contenido a escribir")