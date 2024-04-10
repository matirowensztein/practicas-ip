sumaRacionales :: Int -> Int -> Float
sumaRacionales n 0 = 0
sumaRacionales n m = sumaInterna n m + sumaRacionales n (m-2)
    where sumaInterna :: Int -> Int -> Float
          sumaInterna 0 q = 0
          sumaInterna p q = (fromIntegral p / fromIntegral q) + sumaInterna (p-2) q