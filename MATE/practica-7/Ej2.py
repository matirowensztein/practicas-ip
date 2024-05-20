def cerosEnPosicionesPares(arr: list[int]) -> None:
    for i in range(len(arr) // 2):
        arr[i*2+1] = 0

l: list[int] = [2,4,5,6,5,8,4]
cerosEnPosicionesPares(l)
assert l == [2,0,5,0,5,0,4]

l: list[int] = [2,4,5,6,5,8,4,2]
cerosEnPosicionesPares(l)
assert l == [2,0,5,0,5,0,4,0]

def cerosEnPosicionesParesIn(arr: list[int]) -> list[int]:
    res: list[int] = []
    for i in range(len(arr)):
        if i % 2 == 0:
            res.append(arr[i])
        else:
            res.append(0)
    return res

assert cerosEnPosicionesParesIn([2,4,5,6,5,8,4]) == [2,0,5,0,5,0,4]
assert cerosEnPosicionesParesIn([2,4,5,6,5,8,4,2]) == [2,0,5,0,5,0,4,0]

def sin_vocales(s: str) -> str:
    res = ""

    for c in s:
        es_vocal = False
        for vocal in ['a','e','i','o','u']:
            if c == vocal or c == chr(ord(vocal) + ord('A') - ord('a')):
                es_vocal = True

        if not es_vocal:
            res += c
 
    return res

assert sin_vocales("hola") == "hl"

def reemplaza_vocales(s: str) -> str:
    res = ""

    for c in s:
        es_vocal = False
        for vocal in ['a','e','i','o','u']:
            if c == vocal or c == chr(ord(vocal) + ord('A') - ord('a')):
                es_vocal = True

        if es_vocal:
            res += "_"
        else:
            res += c
 
    return res

assert reemplaza_vocales("hola") == "h_l_"


def da_vuelta_str(s: str) -> str:
    res = ""

    for c in s:
        res = c + res
 
    return res

assert da_vuelta_str("hola") == "aloh"

def da_vuelta_str2(s: str) -> str:
    res = ""

    for i in range(len(s)-1, -1, -1):
        res += s[i]
 
    return res

assert da_vuelta_str2("hola") == "aloh"

def da_vuelta_str3(s: str) -> str:
    res = ""

    for i in range(len(s)):
        res += s[len(s)-i-1]
 
    return res

assert da_vuelta_str3("hola") == "aloh"

def perteneceCaracter(s: str, e: str) -> bool:
    for t in s:
        if t == e:
            return True
    return False

def eliminar_repetidos(s: str) -> str:
    res: str = ""
    
    for c in s:
        if not perteneceCaracter(res, c):
            res += c

    return res
        
assert eliminar_repetidos("anana") == "an"


