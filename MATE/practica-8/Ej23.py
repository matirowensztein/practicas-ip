def agregar_producto(inventario: dict, nombre: str, precio: float, cantidad: int):
    data = {
        "precio": precio,
        "cantidad": cantidad
    }

    inventario[nombre] = data

def actualizar_stock(inventario: dict, nombre: str, cantidad: int):
    inventario[nombre]["cantidad"] = cantidad

def actualizar_precios(inventario: dict, nombre: str, precio: int):
    inventario[nombre]["precio"] = precio

def calcular_valor_inventario(inventario: dict):
    res = 0
    for producto in inventario.values():
        res += producto["cantidad"] * producto["precio"]
    return res

