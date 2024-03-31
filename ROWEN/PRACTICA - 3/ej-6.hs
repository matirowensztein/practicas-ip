bisiesto :: Integer ->Bool
bisiesto año | mod año 4 /= 0 || (mod año 100 == 0 && mod año 400 /= 0) = False
             | otherwise = True