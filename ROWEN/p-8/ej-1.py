def contarlineas(nombre_archivo: str) -> int:
    contador:int = 0

    arch = open(nombre_archivo, "r")
    lineas = arch.readlines()
    
    for linea in lineas:
        contador += 1
        
    arch.close()
    
    return contador

def existePalabra(palabra: str, nombre_archivo: str):
        existe_palabra: bool = False
    
        arch = open(nombre_archivo, "r")
        texto = arch.read()
        
        if palabra in texto:
            existe_palabra = True
        
        return existe_palabra
    
def cantidadApariciones(nombre_archivo: str, palabra: str) -> int:
    p_temporal: str = ""
    contador: int = 0
        
    arch = open(nombre_archivo, "r")
    texto = arch.read()
    
    for char in texto:
        if char == " " or char == "\n":
            if palabra == p_temporal:
                contador += 1
                p_temporal = ""
            else:
                p_temporal = ""
        else: 
            p_temporal += char

    arch.close()
    
    return contador

print(cantidadApariciones("p-8\\textos.txt","Hola"))


lop = open("p-8\\textos.txt", "r")
print(lop.readlines())

