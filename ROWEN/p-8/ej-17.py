from queue import Queue as Cola
from typing import Tuple

c = Cola()

def n_pacientes_urgentes(c: Cola[Tuple[int, str, str]]) -> int:
    cant_urgentes:int = 0
    
    while not c.empty():
        paciente = c.get()
        
        if paciente[0] <= 3:
            cant_urgentes += 1
        
    return cant_urgentes

c.put([2,"c","t"])
c.put([8,"c","t"])
c.put([4,"c","t"])
c.put([3,"c","t"])
c.put([2,"c","t"])
c.put([8,"c","t"])
print(n_pacientes_urgentes(c))