def es_palindromo(palabra:str) -> bool:
    p_reverso: str = ""
    palindromo: bool = False

    for i in palabra[::-1]:
        p_reverso += i
    
    if p_reverso == palabra :
        palindromo = True
    
    return palindromo