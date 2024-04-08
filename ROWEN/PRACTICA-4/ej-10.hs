ejercicioA:: Integer -> Integer
ejercicioA 0 = 1
ejercicioA n = 2^n + ejercicioA(n-1)

ejercicioB:: Integer -> Integer -> Integer
ejercicioB 0 q = 0
ejercicioB n q = q^n + ejercicioB(n-1) q

ejercicioC:: Integer -> Integer -> Integer
ejercicioC 0 q = 0
ejercicioC n q = q^n + ejercicioC(n-1) q