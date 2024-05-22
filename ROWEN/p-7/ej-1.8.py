def cuenta_bancaria(movimientos:list):
    saldo_actual: int = 0
    
    for i in movimientos:
        if i[0] == "I":
            saldo_actual += i[1]
        else:
            saldo_actual -= i[1]
        
    return saldo_actual
