from queue import LifoQueue as Pila

p = Pila()

def copiar_pila(p: Pila):
    p_res = Pila()
    p_temp = Pila()
    
    while not p.empty():
        valor = p.get()
        p_temp.put(valor)
        p_res.put(valor)
        
    while not p_temp.empty():
        valor = p_temp.get()
        p.put(valor)
        
    return p_res
        
    
def buscar_el_maximo(p: Pila):
    maximo: int = 0

    p_nums: Pila = copiar_pila(p)
    
    while not p_nums.empty():
        valor = p_nums.get()
        
        if valor > maximo:
            maximo = valor
            
    return p.queue


p.put(1)
p.put(15)
p.put(11)
p.put(51)
p.put(18)

print(buscar_el_maximo(p))


        