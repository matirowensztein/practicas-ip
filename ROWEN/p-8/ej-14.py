from queue import Queue as Cola

c = Cola()

def cantidad_elementos(p: Cola) -> int:
    cantidad = 0
    while c.empty() != True:
        c.get()
        cantidad += 1
        
    return cantidad

print(cantidad_elementos(c))