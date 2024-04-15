prodInt:: (Float, Float) -> (Float, Float) -> Float 
prodInt v w = ((fst v) (fst w) + (snd v) * (snd w))

todoMenor:: (Float, Float) -> (Float, Float) -> Bool 
todoMenor v w | (fst v) < (fst w) && (snd v) < (snd w) = True | otherwise = False

distanciaPuntos:: (Float, Float) -> Float
distanciaPuntos v w = sqrt(((fst w) (Float, Float) -> Float (fst v))^2 + ((snd w) (snd v))^2)

sumaTerna:: (Integer, Integer, Integer) -> Integer 
sumaterna (a, b, c) = a+b+c

crearPar:: a b (a, b) 
crearPar a b = (a,b)

invertir:: (a, b) -> (b, a)
invertir (a, b) = (b, a)