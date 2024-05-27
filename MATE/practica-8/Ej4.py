def agregar_frase(nombre: str, frase: str) -> None:
    archivo = open(nombre, "a")
    archivo.write("\n" + frase)
    archivo.close()

agregar_frase("./data/test2.txt", "Hola\nEsta es otra linea")