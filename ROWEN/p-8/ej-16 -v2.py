from queue import Queue as Cola
import random

def armar_secuencia_de_bingo():
    c = Cola()
    lista_nums: list[int] = []
    
    for i in range(0,100):
        lista_nums.append(i)
        
    while lista_nums != []:
        pos_azar: int = random.randint(0,100)
        if len(lista_nums) - 1 >= pos_azar:
            c.put(lista_nums[pos_azar])
            lista_nums.pop(pos_azar)
        
    print(c.queue)

# armar_secuencia_de_bingo()

def copiar_cola(c: Cola[int]):
    c_temp: Cola[int] = Cola()
    c_res: Cola[int] = Cola()
    
    while not c.empty():
        valor = c.get()
        c_temp.put(valor)
        
    while not c_temp.empty():
        valor = c_temp.get()
        c_res.put(valor)
        c.put(valor)
        
    return c_res

def pos_carton(carton: list[int], bolita: int) -> int:
    b_encontrada: bool = False
    pos:int = 0
    
    for n in carton:
        if not b_encontrada:
            if n == bolita:
                b_encontrada = True
            else:
                pos += 1
                
    return pos

bolillero: Cola[int] = Cola()

def jugar_carton_de_bingo(carton: list[int], bolillero: Cola[int]) -> int:
    fin_bingo: bool = False
    cant_jugadas: int = 0
    copia_carton: list[int] = carton.copy()
    copia_bolillero: Cola[int] = Cola()
    
    copia_bolillero = copiar_cola(bolillero)
    
    while not copia_bolillero.empty():
        bolita = copia_bolillero.get()
        
        if not fin_bingo:
            if bolita in copia_carton:
                copia_carton.pop(pos_carton(copia_carton,bolita))
        
            if copia_carton == []:
                fin_bingo = True
        
            cant_jugadas += 1
            
    return cant_jugadas

bolillero.put(1)
bolillero.put(2)
bolillero.put(6)
bolillero.put(3)
print(jugar_carton_de_bingo([1,2,3],bolillero))