from array import *

def suma2(x:int, y: int) -> int:
    res: int = x + y
    return res

def suc(c: int) -> int:
    x = c
    # Estado a;
    x = x + 2
    # Estado b;
    # Estado x == x @a+2;
    x = x - 1
    # Estado c;
    # vale x == x@b-1;
    return x

# in valor, inout referencia
def duplicar(valor: str, referencia: list):
    valor *= 2
    referencia *= 2

# este test pasa correctamente
def testDuplicar():
    x: str = "abc"
    y: list = ['a','b','c']

    duplicar(x,y)

    assert x == "abc"
    assert y == ['a','b','c','a','b','c']

# in valor
def duplicar2(x: list) -> list:
    y: list = x.copy()
    y *= 2
    return y

testDuplicar()

def probandoListas():
    a: list = [1,2,3,4,5]

    a.append(6)
    a.pop()
    a.pop(0)

    a[0] = 10
    a[3] = 20

    print(a[3])
    # print(a.buffer_info()) no existe en una lista, solo en los arreglos

def probandoArreglos():
    a: array = array('i', [2,4,5])
    a[2] = 8
    a.append(5)
    a.remove(4)
    print(a[2])
    print(a.buffer_info())


