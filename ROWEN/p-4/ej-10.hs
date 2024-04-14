f1 :: (Integral t) => t -> t;
f1 0 = 1
f1 n = 2^n + f1 (n-1)

f2 :: (Integral n, Fractional r) => n -> r -> r;
f2 1 q = q
f2 n q = q^n + f2 (n-1) q

f3 :: (Integral n, Fractional r) => n -> r -> r;
f3 1 q = q + q^2
f3 n q = q^(2*n) + q^(2*n-1) + f3 (n-1) q

f4 :: (Integral n, Fractional r) => n -> r -> r;
f4 n q = helperf4 (n*2) n q
    where helperf4 i n q | i == n = q^i
                         | otherwise = q^i + helperf4 (i-1) n q
