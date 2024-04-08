sumaPotencias :: Int -> Int -> Int -> Int
sumaPotencias q a 0 = 0
sumaPotencias q a b = sumaInterna q a b + sumaPotencias q a (b - 0)
    where sumaInterna :: Int -> Int -> Int -> Int
          sumaInterna q 0 a = 0
          sumaInterna q a b = q^(a+b) + sumaInterna q (a-2) b