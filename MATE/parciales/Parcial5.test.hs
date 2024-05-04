import Parcial5
import Test.HUnit

tests = TestList [p1Tests, p2Tests, p3Tests, p4Tests, p5Tests]

p1Tests =
  test
    [ "" ~: cantMinuscula "" ~?= 0,
      "" ~: cantMinuscula "a" ~?= 1,
      "" ~: cantMinuscula "A" ~?= 0,
      "" ~: cantMinuscula "gF#!$.SDfSA" ~?= 2,
      "" ~: cantMinuscula "gfa.sSDfSA" ~?= 5
    ]

p2Tests =
  test
    [ "" ~: maximoCambios [""] ~?= "",
      "" ~: maximoCambios ["abc"] ~?= "abc",
      "" ~: maximoCambios ["abcd", "abc"] ~?= "abcd",
      "" ~: maximoCambios ["abc", "abcde"] ~?= "abcde",
      "" ~: maximoCambios ["abcSJDFLK", "abcde"] ~?= "abcde"
    ]

p3Tests =
  test
    [ "" ~: desplazar 'b' 2 ~?= 'd',
      "" ~: desplazar 'b' (-1) ~?= 'a',
      "" ~: desplazar 'x' 4 ~?= 'b',
      "" ~: desplazar 'b' (-3) ~?= 'y',
      "" ~: desplazar ';' 2 ~?= ';'
    ]

p4Tests =
  test
    [ "" ~: codificar "abc" 1 ~?= "bcd",
      "" ~: codificar "abc" (-1) ~?= "zab",
      "" ~: codificar "aBc" (-1) ~?= "zBb",
      "" ~: codificar "ac" 3 ~?= "df"
    ]

p5Tests =
  test
    [ "" ~: decodificar "bcd" 1 ~?= "abc",
      "" ~: decodificar "zab" (-1) ~?= "abc",
      "" ~: decodificar "zBb" (-1) ~?= "aBc",
      "" ~: decodificar "df" 3 ~?= "ac"
    ]

main = runTestTT tests
