from queue import LifoQueue as Pila

p = Pila()

# 3 4 +
def evaluar_expresion(s: str) -> float:
    valor:str = ""
    cant_o:int = len(s)
    nums:list = []

    while cant_o > 0 :
        p.put(s[cant_o - 1])
        cant_o -= 1
    
    while not p.empty():
        valor = p.get()
        
        if valor != "+" and valor != "-" and valor != "*" and valor != "/"  and valor != " ":
            nums.append(float(valor))
            
        if nums != [] and (valor == "+" or valor == "-" or valor == "*" or valor == "/"):    
            if valor == "+":
                p.put(str(nums[0] + nums[1]))
                nums = []
            elif valor == "-":
                p.put(str(nums[0] - nums[1]))
                nums = []
            elif valor == "*":
                p.put(str(nums[0] * nums[1]))
                nums = []
            else:
                p.put(str(nums[0] / nums[1]))
                nums = []
            
    return float(valor)
    
print(evaluar_expresion("3 4 + 5 * 2 -"))