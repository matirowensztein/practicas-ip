from queue import LifoQueue as Pila

def visitar_sitio(historiales: dict[str, Pila[str]], usuario: str, sitio: str):
    historiales[usuario].put(sitio)

def navegar_atras(historiales: dict[str, Pila[str]], usuario: str):
    anteultimo = historiales[usuario].get()
    ultimo = historiales[usuario].get()
    historiales[usuario].put(anteultimo)
    historiales[usuario].put(ultimo)

