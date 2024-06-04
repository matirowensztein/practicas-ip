from queue import LifoQueue as Pila

def formula_bien_balanceada(s: str) -> bool:
    formula_balanceada: bool = True
    pila: Pila = Pila()

    for c in s:
        if c == "(":
            pila.put("(")
        elif c == ")":
            if pila.empty():
                formula_balanceada = False
            else:
                pila.get()

    return formula_balanceada and pila.empty()

def formula_bien_balanceada_sin_pilas(s: str) -> bool:
    formula_balanceada: bool = True
    parentesis_sin_cerrar: int = 0

    for c in s:
        if c == "(":
            parentesis_sin_cerrar += 1
        elif c == ")":
            parentesis_sin_cerrar -= 1
        if c == -1:
            formula_balanceada = False

    return formula_balanceada and parentesis_sin_cerrar == 0

assert formula_bien_balanceada("1 + (2 * 3)")
assert not formula_bien_balanceada("(1 + (2 * 3)")
assert not formula_bien_balanceada(")1 + (2 * 3)")
assert formula_bien_balanceada("(1 + (2) * 3)")
assert formula_bien_balanceada("(((())))")
assert not formula_bien_balanceada("(((()))")
assert not formula_bien_balanceada("(((()))))")
