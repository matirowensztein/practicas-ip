def analizar(str: str) -> str:
    if len(str) < 5:
        return "ROJA"

    tiene_minuscula: bool = False
    tiene_mayuscula: bool = False
    tiene_numerico: bool = False

    for c in str:
        if (c >= 'a' and c <= 'z') or c == 'ñ':
            tiene_minuscula = True
        elif (c >= 'A' and c <= 'Z') or c == 'Ñ':
            tiene_mayuscula = True
        elif c >= '0' and c <= '9':
            tiene_numerico = True

    if len(str) > 8 and tiene_minuscula and tiene_mayuscula and tiene_numerico:
        return "VERDE"
    return "AMARILLA"