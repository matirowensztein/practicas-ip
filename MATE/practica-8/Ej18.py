from queue import Queue as Cola

'''
problema atencion_a_clientes(in c : Cola[(String, N, Bool, Bool)]): Cola[(String, N, Bool, Bool)] {
    requiere { |c| > 0 }
    asegura { todos los elementos de res estan ordenados en base a la primera prioridad, y si no en base a la segunda
              prioridad }
    asegura { todos los elementos de res con la misma prioridad tendran el mismo orden relativo que en c }
}
'''

def atencion_a_clientes(c: Cola[tuple[str,int,bool,bool]]) -> Cola[tuple[str,int,bool,bool]]:
    res: Cola[tuple[str,int,bool,bool]] = Cola()
    copy: Cola[tuple[str,int,bool,bool]] = Cola()

    while not c.empty():
        val: tuple[str,int,bool,bool] = c.get()
        copy.put(val)
        if val[2] == True:
            res.put(val)

    while not copy.empty():
        val: tuple[str,int,bool,bool] = copy.get()
        c.put(val)
        if val[2] == False and val[3] == True:
            res.put(val)
        
    while not c.empty():
        val: tuple[str,int,bool,bool] = c.get()
        copy.put(val)
        if val[2] == False and val[3] == False:
            res.put(val)

    while not copy.empty():
        val: tuple[str,int,bool,bool] = copy.get()
        c.put(val)

    return res

c = Cola()
c.put(("", 1, False, False))
c.put(("", 2, False, True))
c.put(("", 3, True, False))
c.put(("", 4, False, True))
res = atencion_a_clientes(c)
while not res.empty():
    print(res.get())

