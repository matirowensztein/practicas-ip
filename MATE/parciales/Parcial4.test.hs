import Parcial4
import Test.HUnit

tests = TestList [p1Tests, p2Tests, p3Tests, p4Tests]

p1Tests =
  test
    [ "" ~: golesDeNoGoleadores [] [] 0 ~?= 0,
      "" ~: golesDeNoGoleadores [("rojo", "juan")] [3] 3 ~?= 0,
      "" ~: golesDeNoGoleadores [("rojo", "juan")] [3] 5 ~?= 2,
      "" ~: golesDeNoGoleadores [("rojo", "juan"), ("azul", "pedro")] [3, 2] 5 ~?= 0,
      "" ~: golesDeNoGoleadores [("rojo", "juan"), ("azul", "pedro")] [3, 2] 9 ~?= 4
    ]

p2Tests =
  test
    [ "" ~: equiposValidos [] ~?= True,
      "" ~: equiposValidos [("rojo", "juan")] ~?= True,
      "" ~: equiposValidos [("rojo", "rojo")] ~?= False,
      "" ~: equiposValidos [("rojo", "juan"), ("azul", "pedro")] ~?= True,
      "" ~: equiposValidos [("rojo", "juan"), ("azul", "juan")] ~?= False,
      "" ~: equiposValidos [("rojo", "juan"), ("rojo", "pedro")] ~?= False,
      "" ~: equiposValidos [("rojo", "rojo"), ("azul", "pedro")] ~?= False,
      "" ~: equiposValidos [("rojo", "juan"), ("azul", "rojo")] ~?= False,
      "" ~: equiposValidos [("rojo", "juan"), ("azul", "pedro"), ("verde", "lucas")] ~?= True,
      "" ~: equiposValidos [("rojo", "juan"), ("azul", "pedro"), ("verde", "juan")] ~?= False,
      "" ~: equiposValidos [("rojo", "juan"), ("azul", "pedro"), ("verde", "azul")] ~?= False
    ]

p3Tests =
  test
    [ "" ~: porcentajeDeGoles "juan" [("rojo", "juan")] [4] ~?= 100,
      "" ~: porcentajeDeGoles "pedro" [("rojo", "juan")] [4] ~?= 0,
      "" ~: porcentajeDeGoles "juan" [("rojo", "juan"), ("azul", "pedro")] [4, 1] ~?= 80,
      "" ~: porcentajeDeGoles "pedro" [("rojo", "juan"), ("azul", "pedro")] [4, 1] ~?= 20,
      "" ~: porcentajeDeGoles "lucas" [("rojo", "juan"), ("azul", "pedro"), ("verde", "lucas")] [4, 1, 15] ~?= 75
    ]

p4Tests =
  test
    [ "" ~: botinDeOro [("rojo", "juan")] [1] ~?= "juan",
      "" ~: botinDeOro [("rojo", "juan"), ("azul", "pedro")] [2, 1] ~?= "juan",
      "" ~: botinDeOro [("rojo", "juan"), ("azul", "pedro")] [1, 1] ~?= "juan",
      "" ~: botinDeOro [("rojo", "juan"), ("azul", "pedro")] [1, 2] ~?= "pedro",
      "" ~: botinDeOro [("rojo", "juan"), ("azul", "pedro"), ("verde", "lucas")] [2, 1, 0] ~?= "juan",
      "" ~: botinDeOro [("rojo", "juan"), ("azul", "pedro"), ("verde", "lucas")] [1, 1, 2] ~?= "lucas"
    ]

main = runTestTT tests
