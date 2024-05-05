import Parcial6
import Test.HUnit

p1Tests =
  test
    [ "" ~: atajaronSuplentes [("rojo", "a")] [3] 4 ~?= 1,
      "" ~: atajaronSuplentes [("rojo", "a"), ("azul", "b")] [3, 2] 5 ~?= 0,
      "" ~: atajaronSuplentes [("rojo", "a"), ("azul", "b")] [3, 2] 7 ~?= 2
    ]

p2Tests =
  test
    [ "" ~: equiposValidos [("rojo", "a")] ~?= True,
      "" ~: equiposValidos [("rojo", "a"), ("azul", "b")] ~?= True,
      "" ~: equiposValidos [("rojo", "a"), ("rojo", "b")] ~?= False,
      "" ~: equiposValidos [("rojo", "a"), ("azul", "b"), ("verde", "c")] ~?= True,
      "" ~: equiposValidos [("rojo", "a"), ("azul", "b"), ("rojo", "c")] ~?= False
    ]

p3Tests =
  test
    [ "" ~: porcentajeDeGoles "a" [("rojo", "a")] [1] ~?= 100,
      "" ~: porcentajeDeGoles "a" [("rojo", "a"), ("azul", "b")] [1, 3] ~?= 25,
      "" ~: porcentajeDeGoles "a" [("rojo", "a"), ("rojo", "b")] [4, 1] ~?= 80,
      "" ~: porcentajeDeGoles "a" [("rojo", "a"), ("azul", "b"), ("verde", "c")] [2, 2, 1] ~?= 40
    ]

p4Tests =
  test
    [ "" ~: vallaMenosVencida [("rojo", "a")] [1] ~?= "a",
      "" ~: vallaMenosVencida [("rojo", "a"), ("azul", "b")] [1, 3] ~?= "b",
      "" ~: vallaMenosVencida [("rojo", "a"), ("rojo", "b")] [4, 1] ~?= "a",
      "" ~: vallaMenosVencida [("rojo", "a"), ("azul", "b"), ("verde", "c")] [2, 2, 1] ~?= "a"
    ]

tests = TestList [p1Tests, p2Tests, p3Tests, p4Tests]

main = runTestTT tests
