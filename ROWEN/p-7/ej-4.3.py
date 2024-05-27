# Vamos a escribir un programa para simular el juego conocido como 7 y medio. El mismo deber´a generar un n´umero
# aleatorio entre 0 y 12 (excluyendo el 8 y 9) y deber´a luego preguntarle al usuario si desea seguir sacando otra “carta”
# o plantarse. En este ´ultimo caso el programa debe terminar. Los n´umeros aleatorios obtenidos deber´an sumarse seg´un
# el n´umero obtenido salvo por las “figuras” (10, 11 y 12) que sumar´an medio punto cada una. El programa debe ir
# acumulando los valores y si se pasa de 7.5 debe informar que el usuario ha perdido. Al finalizar la funci´on devuelve
# el historial de “cartas” que hizo que el usuario gane o pierda. Para generar n´umeros pseudo-aleatorios entre 1 y 12
# utilizaremos la funci´on random.randint(1,12). Al mismo tiempo, la funci´on random.choice() puede ser de gran
# ayuda a la hora de repartir cartas.

import random

def generador_carta() -> int:
  while True:
        num = random.randint(1, 12)
        if num != 8 and num != 9:
            return num
        
def puntaje_carta(carta:float) -> float:
    if carta != 10 and carta != 11 and carta != 12:
        return carta
    else:
        return 0.5
  

def siete_y_medio() -> list:
    cartas: list = []
    fin_juego: bool = True
    puntaje: float = 0
    
    print("7 y medio")
    print("Si desea seguir sacando otra “carta”, ingrese ”S”. Y si quiere plantarse, ingrese ”P”.")

    while fin_juego:
        operacion: str = input("Que desea hacer: ")
    
        if operacion == "S":
            carta = generador_carta()
            puntaje += puntaje_carta(carta)
            cartas.append(carta)
            
            if puntaje > 7.5:
                print("Perdiste.")
                fin_juego = False
                    
        elif operacion == "P":
            fin_juego = False
        else:
            print("Ingrese una operación valida.")
    
    if puntaje < 7.5:
        print("Ganaste.")
        
    return cartas

print(siete_y_medio())