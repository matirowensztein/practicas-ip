# def atencion_a_clientes(c: Cola[(str, int, bool, bool)]) -> Cola[(str, int, bool, bool)]:
#     requiere: Los pacientes deben ingresar su nombre y Apellido, DNI, tipo de cuenta (si es preferencial o no) y si tiene prioridad por ser adulto +65, embarazada o con movilidad reducida (prioridad si o no).
#     asegura: res = Primero las personas que tienen prioridad, luego las que tienen cuenta bancaria preferencial y por ultimo el resto. 
#     aegura: res = Dentro de cada subgrupo de clientes, se respeta el orden de llegada.

from queue import Queue as Cola
from typing import Tuple

c = Cola()

def copiar_cola(c = Cola()):
    p_res = Cola()
    p_temp = Cola()
    
    while not c.empty():
        valor = c.get()
        p_temp.put(valor)
        p_res.put(valor)
        
    while not p_temp.empty():
        valor = p_temp.get()
        c.put(valor)
        
    return p_res

def atencion_a_clientes(c: Cola[Tuple[str, int, bool, bool]]) -> Cola[Tuple[str, int, bool, bool]]:
    fst_c: Cola[Tuple[str, int, bool, bool]] = Cola()
    snd_c: Cola[Tuple[str, int, bool, bool]] = Cola()
    trd_c: Cola[Tuple[str, int, bool, bool]] = Cola()
    
    c_clientes: Cola[Tuple[str, int, bool, bool]] = copiar_cola(c)
    
    while not c_clientes.empty():
        cliente = c_clientes.get()
        
        if cliente[3] == True:
            fst_c.put(cliente)
        elif cliente[3] == False and cliente[2] == True:
            snd_c.put(cliente)
        else:
            trd_c.put(cliente)
            
    while not fst_c.empty():
        cliente = fst_c.get()
        c_clientes.put(cliente)
            
    while not snd_c.empty():
        cliente = snd_c.get()
        c_clientes.put(cliente)
            
    while not trd_c.empty():
        cliente = trd_c.get()
        c_clientes.put(cliente)
        
    return c

c.put([1,"c",True,False])
c.put([2,"c",True,True])
c.put([3,"c",True,False])
c.put([4,"c",True,True])
c.put([5,"c",False,False])

resultado = atencion_a_clientes(c)
while not resultado.empty():
    print(resultado.get())

