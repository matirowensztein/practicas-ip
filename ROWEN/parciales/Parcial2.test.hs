import Test.HUnit
import Parcial2

main = runTestTT tests

tests = test [
        "" ~: (votosEnBlanco  [("Juan","Susana"), ("Maria","Pablo")] [20,10] 100) ~?= 70,

        "" ~: (formulasValidas  [("Juan","Susana")] ) ~?= True,
        "" ~: (formulasValidas  [("Juan","Juan")] ) ~?= False,
        "" ~: (formulasValidas  [("Juan","Susana"), ("Maria","Pablo")] ) ~?= True,
        "" ~: (formulasValidas  [("Juan","Susana"), ("Juan","Pablo")] ) ~?= False,
        "" ~: (formulasValidas  [("Juan","Susana"), ("Maria","Juan")] ) ~?= False,
        "" ~: (formulasValidas  [("Juan","Susana"), ("Susana","Pablo")] ) ~?= False,
        "" ~: (formulasValidas  [("Juan","Susana"), ("Maria","Susana")] ) ~?= False,
        "" ~: (formulasValidas  [("Juan","Susana"), ("Juan","Susana")] ) ~?= False,

        "" ~: (porcentajeDeVotos "Juan" [("Juan","Susana"), ("Maria","Pablo"), ("Julian","Hector")] [70,20,10]) ~?= 70.0,

        "" ~: (proximoPresidente [("Juan","Susana"), ("Maria","Pablo"), ("Julian","Hector")] [70,20,10]) ~?= "Juan"
        ]