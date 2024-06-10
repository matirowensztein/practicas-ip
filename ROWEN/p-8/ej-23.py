inventario = {}

def agregar_producto(inventario: dict, nombre: str, precio:float, cantidad: int):
    inventario[nombre] = dict(Precio = precio, Cantidad = cantidad)
    
    return inventario

def actualizar_stock(inventario: dict, nombre: str, cantidad: int):
    inventario[nombre]["Cantidad"] = cantidad
    
    return inventario

def actualizar_precios(inventario: dict, nombre: str, precio: int):
    inventario[nombre]["Precio"] = precio
    
    return inventario

def calcular_valor(inventario: dict) -> float:
    valor_total:float = 0
    
    for n,v in inventario.items():
        valor_total += (v["Precio"] * v["Cantidad"])
        
    return valor_total

agregar_producto(inventario, "Camisa", 20.0, 50)
agregar_producto(inventario, "Pantalon", 30.0, 30)
actualizar_stock(inventario, "Camisa", 10)
print(inventario)
valor_total = calcular_valor(inventario)
print(inventario)
print(f"Valor total del inventario: {valor_total}")