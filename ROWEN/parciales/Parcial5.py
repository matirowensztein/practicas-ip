# -- (1)

from queue import Queue as Cola

filaClientes = Cola()


def reordenar_cola_priorizando_vips(filaClientes: Cola[tuple[str, str]]) -> Cola[str]:
    cola_final: Cola[str] = Cola()
    cola_mas_espera: Cola[str] = Cola()
    cola_temp: Cola[tuple[str, str]] = Cola()

    while not filaClientes.empty():
        tupla_cliente: tuple[str, str] = filaClientes.get()

        if tupla_cliente[1] == "vip":
            cola_final.put(tupla_cliente[0])
        else:
            cola_mas_espera.put(tupla_cliente[0])

        cola_temp.put(tupla_cliente)

    while not cola_mas_espera.empty():
        cliente: str = cola_mas_espera.get()
        cola_final.put(cliente)

    while not cola_temp.empty():
        tupla_cliente: tuple[str, str] = cola_temp.get()
        filaClientes.put(tupla_cliente)

    return cola_final.queue


filaClientes.put(["1", "vip"])
filaClientes.put(["2", "comun"])
filaClientes.put(["3", "comun"])
filaClientes.put(["4", "vip"])
filaClientes.put(["5", "comun"])

# print(reordenar_cola_priorizando_vips(filaClientes))

# -- (2)


def torneo_de_gallinas(estrategias: dict[str, str]) -> dict[str, int]:
    puntaje_jugadores: dict[str, int] = {}
    comportamiento_gallina: str = "me desvio siempre"
    comportamiento_valiente: str = "me la banco y no me desvio"

    for jugador in estrategias:
        puntaje_jugadores[jugador] = 0

        for j in estrategias.keys():
            if j != jugador:
                if (
                    estrategias[j] == comportamiento_valiente
                    and estrategias[jugador] == comportamiento_valiente
                ):
                    puntaje_jugadores[jugador] -= 5

                if (
                    estrategias[j] == comportamiento_gallina
                    and estrategias[jugador] == comportamiento_gallina
                ):
                    puntaje_jugadores[jugador] -= 10

                if (
                    estrategias[j] == comportamiento_gallina
                    and estrategias[jugador] == comportamiento_valiente
                ):
                    puntaje_jugadores[jugador] += 10

                if (
                    estrategias[j] == comportamiento_valiente
                    and estrategias[jugador] == comportamiento_gallina
                ):
                    puntaje_jugadores[jugador] -= 15

    return puntaje_jugadores


# print(torneo_de_gallinas({"A": "me la banco y no me desvio", "B": "me desvio siempre", "C": "me desvio siempre", "D": "me la banco y no me desvio"}))

# -- (3)


def verifica_tateti(columna: list[str]) -> int:
    cant_x: int = 0
    cant_o: int = 0
    res: int = 0

    for c in columna:
        if cant_x < 3 or cant_o < 3:
            if c == "X":
                cant_x += 1

                if cant_o < 3:
                    cant_o = 0
            elif c == "O":
                cant_o += 1

                if cant_x < 3:
                    cant_x = 0
            else:
                if cant_x < 3 and cant_o < 3:
                    cant_x = 0
                    cant_o = 0

    if cant_x == 3 and cant_o == 3:
        res = 3

    if cant_x == 3 and cant_o < 3:
        res = 1

    if cant_x < 3 and cant_o == 3:
        res = 2

    if cant_x < 3 and cant_o < 3:
        res = 0

    return res


# print(verifica_tateti(["O", "O", "O", "X", "X", "X"]))


def quien_gano_el_tateti_facilito(tablero: list[list[str]]) -> int:
    columna_temporal: list[str] = []
    contador: int = 0
    cant_columnas: int = len(tablero)
    pos_col: int = 0
    fin_tateti: bool = False
    res_tateti: int = 0

    while contador <= cant_columnas - 1:
        if not fin_tateti:
            while pos_col <= cant_columnas - 1:
                columna_temporal.append(tablero[pos_col][contador])
                pos_col += 1

            res = verifica_tateti(columna_temporal)
            
            if not res_tateti == 3:
                if (res == 1 and res_tateti == 2) or (res == 2 and res_tateti == 1):
                    res_tateti = 3
                else:
                    if res_tateti != 1 and res_tateti != 2:
                        res_tateti = res

            pos_col = 0
            columna_temporal = []
            contador += 1

    return res_tateti


# print(
#     quien_gano_el_tateti_facilito(
#         [
#             ["O", "O", "", "", ""],
#             ["", "O", "", "", ""],
#             ["", "O", "", "", ""],
#             ["X", "", "", "", ""],
#             ["", "", "", "", ""],
#         ]
#     )
# )

# -- (4)

def reverso_sufijo(sufijo: str) -> str:
    sufijo_al_revez: str = ""
    letras_restantes = len(sufijo) - 1
    
    while letras_restantes >= 0:
        sufijo_al_revez += sufijo[letras_restantes]
        letras_restantes -= 1
        
    return sufijo_al_revez


def analisis_palindromo(sufijo: str) -> bool:
    es_sufijo_palindromo: bool = False
    
    if sufijo == reverso_sufijo(sufijo):
        es_sufijo_palindromo = True

    return es_sufijo_palindromo

# print(analisis_palindromo("oso"))


def cuantos_sufijos_son_palindromos(texto: str) -> int:
    sufijo_temporal:str = ""
    pos_letras_texto: int = len(texto) - 1
    contador_palindromos: int = 0
    contador_pos_letra: int = 0
    contador_sufijo_temporal: int = 0
    
    while contador_pos_letra <= pos_letras_texto:
        while contador_sufijo_temporal <= pos_letras_texto:
            sufijo_temporal += texto[contador_sufijo_temporal]
            contador_sufijo_temporal += 1
        
        if analisis_palindromo(sufijo_temporal):
            contador_palindromos += 1
            
        sufijo_temporal = ""
        contador_pos_letra += 1
        contador_sufijo_temporal = contador_pos_letra
        
    return contador_palindromos
        
print(cuantos_sufijos_son_palindromos("ala"))
            
        
        