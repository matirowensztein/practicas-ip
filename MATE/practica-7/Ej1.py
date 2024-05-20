def pertenece(s: list[int], e: int) -> bool:
    for t in s:
        if t == e:
            return True
    return False

def pertenece2(s: list[int], e: int) -> bool:
    i: int = 0
    while i < len(s):
        if s[i] == e:
            return True
        i += 1
    return False

def pertenece3(s: list[int], e: int) -> bool:
    i: int = 0
    for i in range(len(s)):
        if s[i] == e:
            return True
        i += 1
    return False

assert not pertenece([], 5)
assert pertenece([5], 5)
assert not pertenece([8], 5)
assert pertenece([1,4,5,6], 5)
assert not pertenece([1,4,5,6], 2)

assert not pertenece2([], 5)
assert pertenece2([5], 5)
assert not pertenece2([8], 5)
assert pertenece2([1,4,5,6], 5)
assert not pertenece2([1,4,5,6], 2)

assert not pertenece3([], 5)
assert pertenece3([5], 5)
assert not pertenece3([8], 5)
assert pertenece3([1,4,5,6], 5)
assert not pertenece3([1,4,5,6], 2)

'''
¿Si la especificáramos e implementáramos con tipos genéricos, se podría usar esta misma función para buscar un carácter dentro de un string?
Si, se podría ya que un string es una sequencia de caracteres.
'''

def divide_a_todos(s: list[int], e: int) -> bool:
    for n in s:
        if not n % e == 0:
            return False
    return True

assert divide_a_todos([6,4,2], 2)
assert not divide_a_todos([6,5,2], 2)
assert divide_a_todos([6,3], 3)
assert divide_a_todos([], 3)

def suma_total(s: list[int]) -> int:
    sum: int = 0
    for n in s:
        sum += n
    return sum

assert suma_total([]) == 0
assert suma_total([2]) == 2
assert suma_total([3,-4,6]) == 5

def ordenados(s: list[int]) -> bool:
    for i in range(len(s)-1):
        if s[i] > s[i+1]:
            return False
    return True

assert ordenados([])
assert ordenados([1,2,3])
assert ordenados([1,2,2,3])
assert not ordenados([1,3,2,3])

def alguna_palabra_larga(palabras: list[str]) -> bool:
    for palabra in palabras:
        if len(palabra) > 7:
            return True
    return False

assert not alguna_palabra_larga(["a", "abc"])
assert alguna_palabra_larga(["a", "abcdefgi"])

def palindromo(s: str) -> bool:
    for i in range(len(s)//2):
        if s[i] != s[len(s)-i-1]:
            return False
    return True

assert palindromo("abcba")
assert not palindromo("abcbab")
assert palindromo("abcbababcba")

def analizar(str: str) -> str:
    if len(str) < 5:
        return "ROJA"

    tiene_minuscula: bool = False
    tiene_mayuscula: bool = False
    tiene_numerico: bool = False

    for c in str:
        if (c >= 'a' and c <= 'z') or c == 'ñ':
            tiene_minuscula = True
        elif (c >= 'A' and c <= 'Z') or c == 'Ñ':
            tiene_mayuscula = True
        elif c >= '0' and c <= '9':
            tiene_numerico = True

    if len(str) > 8 and tiene_minuscula and tiene_mayuscula and tiene_numerico:
        return "VERDE"
    return "AMARILLA"

assert analizar("abc") == "ROJA"
assert analizar("abcdñ") == "AMARILLA"
assert analizar("abcdefÑ123") == "VERDE"

def saldo(historial: list[tuple[str,int]]) -> int:
    saldo: int = 0
    for transaccion in historial:
        if (transaccion[0] == 'I'):
            saldo += transaccion[1]
        elif (transaccion[0] == "R"):
            saldo -= transaccion[1]
    return saldo

assert saldo([]) == 0
assert saldo([('I', 200), ('R', 100)]) == 100
assert saldo([('I', 200), ('R', 300)]) == -100

def perteneceCaracter(s: str, e: str) -> bool:
    for t in s:
        if t == e:
            return True
    return False

def tresVocales(s: str):
    vocales: str = ""
    for c in s:
        for vocal in ['a','e','i','o','u']:
            contieneVocal = c == vocal or c == chr(ord(vocal) + ord('A') - ord('a'))
            if (contieneVocal and not perteneceCaracter(vocales, vocal)):
                vocales += vocal
    return len(vocales) >= 3

assert not tresVocales("")
assert not tresVocales("hola")
assert not tresVocales("holaa")
assert tresVocales("holau")
assert tresVocales("holauu")
