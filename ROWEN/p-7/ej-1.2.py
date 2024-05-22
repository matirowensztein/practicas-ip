def divide_a_todos(lista:list, numero:int) -> bool:
    for i in lista:
        if i % numero != 0:
            return False
        
    return True