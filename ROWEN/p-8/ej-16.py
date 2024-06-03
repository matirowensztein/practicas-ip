from queue import Queue as Cola
import random

def armar_secuencia_de_bingo():
    c = Cola()
    bolillas_bingo:list = []
    
    for i in range(1,100):
        bolillas_bingo.append(i)
        
    while not bolillas_bingo == []:
        pos_num = random.randint(0,98)
        
        if pos_num <= (len(bolillas_bingo) - 1):
            c.put(bolillas_bingo[pos_num])
            bolillas_bingo.pop(pos_num)
    
    return c

bolillero = Cola()

def pertenece_carton(carton: list[int], num_bolillero: int):
    pertenece_num = False
    
    for n in carton:
        if n == num_bolillero:
            pertenece_num = True
            
    return pertenece_num
        
def pos_carton(carton: list[int], num_bolillero: int):
    pos_num:int = 0
    
    for n in carton:
        if n == num_bolillero:
            return pos_num
            
        pos_num += 1
        
    return pos_num
            
def jugar_carton_de_bingo(carton: list[int], bolillero: Cola[int]) -> int:
  
    jugadas = 0
    
    while carton != []:
        num_bolillero = bolillero.get()
        if pertenece_carton(carton, num_bolillero):
            carton.pop(pos_carton(carton, num_bolillero))
        jugadas += 1
        
    return jugadas

bolillero.put(1)
bolillero.put(2)
bolillero.put(6)
bolillero.put(4)
bolillero.put(3)
print(jugar_carton_de_bingo([1,2,3], bolillero))
    


