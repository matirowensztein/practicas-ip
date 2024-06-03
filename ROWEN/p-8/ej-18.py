# def atencion_a_clientes(c: Cola[(str, int, bool, bool)]) -> Cola[(str, int, bool, bool)]:
#     requiere: Los pacientes deben ingresar su nombre y Apellido, DNI, tipo de cuenta (si es preferencial o no) y si tiene prioridad por ser adulto +65, embarazada o con movilidad reducida (prioridad si o no).
#     asegura: res = Primero las personas que tienen prioridad, luego las que tienen cuenta bancaria preferencial y por ultimo el resto. 
#     aegura: res = Dentro de cada subgrupo de clientes, se respeta el orden de llegada.

from queue import Queue as Cola
from typing import Tuple

c = Cola()

def atencion_a_clientes(c: Cola[Tuple[str, int, bool, bool]]) -> Cola[Tuple[str, int, bool, bool]]:
    fst_c = Cola()
    snd_c = Cola()
    trd_c = Cola()
    
    while not c.empty():
        cliente = c.get()
        
        if cliente[3] == True:
            fst_c.put(cliente)
        elif cliente[2] == True and cliente[3] != True:
            snd_c.put(cliente)
        else:
            trd_c.put(cliente)
            
    while not fst_c.empty():
        cliente = fst_c.get()
        c.put(cliente)
    
    while not snd_c.empty():
        cliente = snd_c.get()
        c.put(cliente)
        
    while not trd_c.empty():
        cliente = trd_c.get()
        c.put(cliente)
        
    return c

c.put([1,"c",True,False])
c.put([2,"c",True,True])
c.put([3,"c",True,False])
c.put([4,"c",True,True])
c.put([5,"c",False,False])

resultado = atencion_a_clientes(c)
while not resultado.empty():
    print(resultado.get())

