def agregar_frase(nombre: str, frase: str) -> None:
    archivo = open(nombre, "r+")
    contenido = archivo.read()
    archivo.seek(0)
    archivo.write(frase + '\n' + contenido)
    archivo.close()

agregar_frase("./data/test2.txt", "Holaaa\nEsta es otra linea")