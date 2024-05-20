def aprobado(notas: list[int]) -> int:
    suma = 0

    for nota in notas:
        if nota < 4:
            return 3
        suma += nota

    if suma // len(notas) < 7:
        return 2

    return 1

assert aprobado([6,9,7]) == 1
assert aprobado([6,6,7]) == 2
assert aprobado([6,3,7]) == 3

