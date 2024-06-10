def la_palabra_mas_frecuente(texto: str) -> str:
    diccionario: dict[str, int] = {}
    p_temp: str = ""
    p_mas_repetida: str = ""
    p_cond: bool = True
    
    for l in texto:
        if l == " ":
            if p_temp not in diccionario.keys():
                diccionario[p_temp] = 1
            else:
                diccionario[p_temp] += 1
                
            p_temp = ""
        else:
            p_temp += l
            
    for c in diccionario.keys():
        if p_cond:
            p_mas_repetida = c
            p_cond = False
        
        if diccionario[p_mas_repetida] < diccionario[c]:
            p_mas_repetida = c
            
    return p_mas_repetida

print(la_palabra_mas_frecuente("hola comó va hola que tal que tal el clima hoy hola brother"))