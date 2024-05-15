import math

"""
Ejercicio 1. Denir las siguientes funciones y procedimientos:

1. problema imprimir_hola_mundo () {
    requiere: { True }
    asegura: { imprime "¡Hola mundo!" por consola}
}

2. imprimir_un_verso(): que imprima un verso de una canción que vos elijas, respetando los saltos de línea mediante
el caracter.

3. raizDe2(): que devuelva la raíz cuadrada de 2 con 4 decimales. Ver función round

4. factorial_de_dos()
problema factorial_2 () : Z {
    requiere: { True }
    asegura: { res = 2!}
}

5. perimetro: que devuelva el perímetro de la circunferencia de radio 1. Utilizar la biblioteca math mediante el comando
import math y la constante math.pi
problema perimetro () : R {
    requiere: { True }
    asegura: { res = 2 × π }
}
"""

def imprimir_hola_mundo():
    print("¡Hola mundo!")

def imprimir_un_verso():
    print("Y otra vez\nEl Desafío Cumbiero\nDe la mano de MB Musik\nPara toda La Scaloneta, papá\nDale que esta es tuya, Lio\nY el Diegote desde el cielo\n¡Escuchá!\nEn Argentina nací\nTierra de Diego y Lionel\nDe los pibes de Malvinas\nQue jamás olvidaré\nNo te lo puedo explicar\nPorque no vas a entender\nLas finales que perdimos\nCuántos años la lloré\nPero eso se terminó\nPorque en el Maracaná\nLa final con los brazucas\nLa volvió a ganar papá\nMuchachos\nAhora nos volvimo' a ilusionar\nQuiero ganar la tercera\nQuiero ser campeón mundial\nY el Diego\nEn el cielo lo podemos ver\nCon Don Diego y con La Tota\nAlentándolo a Lionel\n¡Cumbia!\nVamos, Selección\nVamos los pibes y las pibas alentando a Argentina\nQue esta es nuestra, la de Qatar la traemos para acá\nPalmas arriba, palmas en alto\nEl Desafío sonando\nNo te lo puedo explicar\nPorque no vas a entender\nLas finales que perdimos\nCuántos años la lloré\nPero eso se terminó\nPorque en el Maracaná\nLa final con los brazucas\nLa volvió a ganar papá\nMuchachos\nAhora nos volvimo' a ilusionar\nQuiero ganar la tercera\nQuiero ser campeón mundial\nY el Diego\nEn el cielo lo podemos ver\nCon Don Diego y con La Tota\nAlentándolo a Lionel")

def raizDe2() -> float:
    return round(math.sqrt(2), 4)

def factorial_2():
    return 2

def perimetro() -> float:
    return 2 * math.pi

