from queue import LifoQueue as Pila

def tokenizar(s: str) -> list[tuple[str,str]]:
    res: list[tuple[str,str]] = []
    curr: str = ""
    
    for c in s:
        if c == "+" or c == "-" or c == "*" or c == "/":
            res.append((c, "OPERADOR"))
        elif (c >= "0" and c <= "9") or c == ".":
            curr += c
        elif c == " ":
            if curr != "":
                res.append((curr, "OPERANDO"))
            curr = ""
        else:
            raise ValueError("Formula invalida")
    
    return res

def evaluar_expresion(s: str) -> float:
    tokens: list[tuple[str,str]] = tokenizar(s)
    operandos: Pila[float] = Pila()

    for token in tokens:
        if token[1] == "OPERANDO":
            operandos.put(float(token[0]))
        elif token[1] == "OPERADOR":
            val2: float = operandos.get()
            val1: float = operandos.get()
            print(val1, val2, token[0])
            if token[0] == "+":
                operandos.put(val1 + val2)
            elif token[0] == "-":
                operandos.put(val1 - val2)
            elif token[0] == "*":
                operandos.put(val1 * val2)
            elif token[0] == "/":
                operandos.put(val1 / val2)

    return operandos.get()

print(evaluar_expresion("1 5 + 2 /"))
print(evaluar_expresion("3 4 + 5 * 2 -"))


