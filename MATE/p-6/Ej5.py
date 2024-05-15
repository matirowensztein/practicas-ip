"""
problema devolver_el_doble_si_es_par(in n: Z): Z {
    requiere { True }
    asegura { res = 2n <=> n es par }
    asegura { res = n <=> n es impar }
}
"""

def devolver_el_doble_si_es_par(n: int) -> int:
    if (n % 2 == 0):
        return 2 * n
    else:
        return n

assert devolver_el_doble_si_es_par(1) == 1
assert devolver_el_doble_si_es_par(2) == 4
assert devolver_el_doble_si_es_par(-3) == -3
assert devolver_el_doble_si_es_par(-4) == -8

"""
problema devolver_valor_si_es_par_sino_el_que_sigue(in n: Z): Z {
    requiere { True }
    asegura { res = n <=> n es par }
    asegura { res = n+1 <=> n es impar }
}
"""

def devoler_valor_si_es_par_sino_el_que_sigue(n: int) -> int:
    if (n % 2 == 0):
        return n
    else:
        return n + 1

assert devoler_valor_si_es_par_sino_el_que_sigue(1) == 2
assert devoler_valor_si_es_par_sino_el_que_sigue(2) == 2
assert devoler_valor_si_es_par_sino_el_que_sigue(-3) == -2
assert devoler_valor_si_es_par_sino_el_que_sigue(-4) == -4

"""
problema devolver_el_doble_si_es_multiplo_de_tres_el_triple_si_es_multiplo_de_9(in n: Z): Z {
    requiere { True }
    asegura { res = 3n <=> 9 | n }
    asegura { res = 2n <=> !(9 | n) && (3 | n) }
}
"""

def devolver_el_doble_si_es_multiplo_de_tres_el_triple_si_es_multiplo_de_9(n: int) -> int:
    if (n % 9 == 0):
        return 3 * n
    elif (n % 3 == 0):
        return 2 * n
    else:
        return n

assert devolver_el_doble_si_es_multiplo_de_tres_el_triple_si_es_multiplo_de_9(1) == 1
assert devolver_el_doble_si_es_multiplo_de_tres_el_triple_si_es_multiplo_de_9(3) == 6
assert devolver_el_doble_si_es_multiplo_de_tres_el_triple_si_es_multiplo_de_9(9) == 27
assert devolver_el_doble_si_es_multiplo_de_tres_el_triple_si_es_multiplo_de_9(-3) == -6

"""
problema lindo_nombre(in nombre: seq<Char>): seq<Char> {
    requiere { True }
    asegura { res = "Tu nombre tiene muchas letras!" <=> |nombre| >= 5 }
    asegura { res = "Tu nombre tiene menos de 5 caracteres" <=> |nombre| < 5 }
}
"""

def lindo_nombre(nombre: str) -> str:
    if (len(nombre) >= 5):
        return "Tu nombre tiene muchas letras!"
    else:
        return "Tu nombre tiene menos de 5 caracteres"

assert lindo_nombre("Mate") == "Tu nombre tiene menos de 5 caracteres"
assert lindo_nombre("Martin") == "Tu nombre tiene muchas letras!"

def el_rango(nombre: int) -> None:
    if (nombre < 5):
        print("Menor a 5")
    elif (nombre <= 20):
        print("Entre 5 y 20")
    else:
        print("Mayor a 20")

def no_quiero_trabajar(s: chr, n: int) -> None:
    menor_de_18: bool = n < 18
    se_jubilo: bool = (s == "F" and n >= 60) or (s == "M" and n >= 65)

    if (menor_de_18 or se_jubilo):
        print("Andá de vacaciones")
    else:
        print("Te toca trabajar")

# no_quiero_trabajar("F", 60)
# no_quiero_trabajar("M", 66)
# no_quiero_trabajar("F", 10)
# no_quiero_trabajar("M", 15)
# no_quiero_trabajar("F", 20)
# no_quiero_trabajar("M", 64)