estanRelacionados :: Integer -> Integer -> Bool
estanRelacionados a b =
    if a /= 0 && b /= 0 then
        if a * a + a * b * ((-a * a) div (a * b)) == 0
            then True
            else False
    else False