mayorDigitoPar :: Integer -> Integer
mayorDigitoPar n = internoMayorDigitoPar n (-1)
    where internoMayorDigitoPar n i 
        | n == 0 = i
        | (n `mod` 10) `mod` 2 == 0 && (n `mod` 10) > i = internoMayorDigitoPar (n `div` 10) (n `mod` 10)
        | otherwise = internoMayorDigitoPar (n `div` 10) i