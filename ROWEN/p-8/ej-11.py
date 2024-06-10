from queue import LifoQueue as Pila

p = Pila()

def esta_bien_balanceada(s: str):
    p_parentesis = Pila()
    p_abrir:int = 0
    p_cerrar: int = 0
    cond_valida: bool = True
        
    for l in s:
        p.put(l)
        l = p.queue
        
    while not p.empty():
        valor = p.get()
        
        if valor in "()":
            p_parentesis.put(valor)

    while not p_parentesis.empty():
        test = p_parentesis.queue
        parentesis = p_parentesis.get()
        
        if parentesis == "(":
            if p_abrir < p_cerrar:
                cond_valida = False
            
            p_abrir += 1
        
        if parentesis == ")":
            p_cerrar += 1
            
            if p_abrir == p_cerrar: 
                p_cerrar = 0
                p_abrir = 0
                   
    if p_abrir != p_cerrar:
        cond_valida = False
            
    return cond_valida
            
print(esta_bien_balanceada("(()())()"))
