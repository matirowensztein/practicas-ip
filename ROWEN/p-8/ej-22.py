from queue import LifoQueue as Pila

p = Pila()

historiales = {"Usuario1" : Pila(), "Usuario2" : Pila()}

def visitar_sitio(historiales: dict[str, Pila[str]], usuario: str, sitio: str):
    historiales[usuario].put(sitio)
    
    return historiales
    
visitar_sitio(historiales, "Usuario1", "https://chatgpt.com/")
visitar_sitio(historiales, "Usuario1", "https://instagram.com/")

print(historiales["Usuario1"].queue)


def navegar_atras(historiales: dict[str, Pila[str]], usuario:str):
    ultimo_sitio = historiales[usuario].get()
    anterior_sitio = historiales[usuario].get()
    
    historiales[usuario].put(ultimo_sitio)
    historiales[usuario].put(anterior_sitio)
    
    return historiales

navegar_atras(historiales, "Usuario1")
print(historiales["Usuario1"].queue)