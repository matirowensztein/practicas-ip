import Ej6
import Test.HUnit

tests = TestList [partesTestSuite]

partesTestSuite =
  test
    [ "caso base" ~: partes 0 ~?= [[]],
      "caso recursivo 1" ~: partes 1 ~?= [[], [1]],
      "caso recursivo 2" ~: partes 2 ~?= [[], [1], [2], [1, 2]],
      "caso recursivo 3" ~: listasIguales (partes 3) [[], [1], [2], [3], [1, 2], [1, 3], [2, 3], [1, 2, 3]] ~?= True
    ]

main = runTestTT tests

contiene _ [] = True
contiene a (b : bs) = b `elem` a && contiene a bs

listasIguales a b = contiene a b && contiene b a
