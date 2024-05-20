import numpy as np

def pertenece(s: list[int], e: int) -> bool:
    for t in s:
        if t == e:
            return True
    return False

def pertenece_a_cada_uno_version_1(s: list[list[int]], e: int, res: list[bool]):
    res.clear()
    for l in s:
        if pertenece(l,e):
            res.append(True)
        else:
            res.append(False)

''' 
Con mi implementacion tambien se satisface la especificacion dos.
La segunda especificacion es mas fuerte que la primera, ya que la implica porque es mas restrictiva.
'''

res: list[bool] = [False, False, True, True, False, False]
pertenece_a_cada_uno_version_1([[1,2,3],[2,3],[3]], 2, res)
assert res == [True, True, False]

def es_matriz(s: list[list[int]]) -> bool:
    cumple_condicion: bool = True
    i: int = 0
    while i < len(s)-1 and cumple_condicion:
        if len(s[i]) != len(s[i+1]):
            cumple_condicion = False
        i += 1
    return cumple_condicion and len(s) > 0 and len(s[0]) > 0

assert not es_matriz([[]])
assert es_matriz([[1]])
assert es_matriz([[1,2],[3,4]])
assert not es_matriz([[1,2],[4]])

def ordenados(s: list[int]) -> bool:
    for i in range(len(s)-1):
        if s[i] > s[i+1]:
            return False
    return True

def filas_ordenadas(m: list[list[int]], res: list[bool]) -> None:
    res.clear()
    for r in m:
        res.append(ordenados(r))

res: list[bool] = []
filas_ordenadas([[1,2,3],[3,1]], res)
assert res == [True, False]

def elevar(d: int, p: int):
    m = np.random.random((d,d))
    res = m

    for _ in range(p-1):
        for i in range(d):
            for j in range(d):
                n: int = 0
                for k in range(d):
                    n += res[i][k] * m[k][j]
                m[i][j] = n
    
    return res

print(elevar(2,2))
    
