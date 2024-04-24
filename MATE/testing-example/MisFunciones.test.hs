import MisFunciones
import Test.HUnit

fibTest = test [
       "Caso base 1" ~: (fib 0) ~?= 0,
       "Caso base 2" ~: (fib 1) ~?= 1,
       "Caso recursivo 1" ~: (fib 2) ~?= 1,
       "Caso recursivo 2" ~: (fib 4) ~?= 3
       ]

factorialTest = test [
       "Caso base" ~: (factorial 0) ~?= 1,
       "Caso recursivo 1" ~: (factorial 3) ~?= 6,
       "Caso recursivo 2" ~: (fib 5) ~?= 120
       ]

qsortTest = test [
       "Caso base" ~: (factorial 0) ~?= 1,
       "Caso recursivo 1" ~: (factorial 3) ~?= 6,
       "Caso recursivo 2" ~: (fib 5) ~?= 120
       ]

tests = TestList [TestLabel "fib" fibTest, TestLabel "factorial" factorialTest, TestLabel "qsort" qsortTest]

ejecutar = runTestTT tests
