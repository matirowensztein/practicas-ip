import Practica
import Test.HUnit

menorDivisorTests = TestList [
                    "" ~: menorDivisor 2 ~?= 2,
                    "" ~: menorDivisor 4 ~?= 2,
                    "" ~: menorDivisor 5 ~?= 5,
                    "" ~: menorDivisor 10 ~?= 2,
                    "" ~: menorDivisor 15 ~?= 3
                    ]

esPrimoTests = TestList [
                    "" ~: esPrimo 1 ~?= False,
                    "" ~: esPrimo 2 ~?= True,
                    "" ~: esPrimo 3 ~?= True,
                    "" ~: esPrimo 4 ~?= False,
                    "" ~: esPrimo 9 ~?= False,
                    "" ~: esPrimo 11 ~?= True
                    ]

relacionesValidasTests = TestList [
                    "" ~: relacionesValidas [] ~?= True,
                    "" ~: relacionesValidas [("a","b")] ~?= True,
                    "" ~: relacionesValidas [("a","a")] ~?= False,
                    "" ~: relacionesValidas [("a","b"),("b","c")] ~?= True,
                    "" ~: relacionesValidas [("a","b"),("a","b")] ~?= False,
                    "" ~: relacionesValidas [("a","b"),("b","a")] ~?= False,
                    "" ~: relacionesValidas [("a","b"),("b","c"),("c","a")] ~?= True,
                    "" ~: relacionesValidas [("a","b"),("b","c"),("b","a")] ~?= False,
                    "" ~: relacionesValidas [("a","b"),("b","c"),("a","a")] ~?= False
                    ]

personasTests = TestList [
                    "" ~: sonIguales (personas []) [] ~?= True,
                    "" ~: sonIguales (personas [("a","b")]) ["a","b"] ~?= True,
                    "" ~: sonIguales (personas [("a","b"),("c","d")]) ["a","b","c","d"] ~?= True,
                    "" ~: sonIguales (personas [("a","b"),("c","a")]) ["a","b","c"] ~?= True,
                    "" ~: sonIguales (personas [("a","b"),("b","c")]) ["a","b","c"] ~?= True,
                    "" ~: sonIguales (personas [("a","b"),("c","d"),("c","a")]) ["a","b","c","d"] ~?= True,
                    "" ~: sonIguales (personas [("a","b"),("c","d"),("e","b")]) ["a","b","c","d","e"] ~?= True
                    ]

amigosDeTests = TestList [
                    "" ~: sonIguales (amigosDe "a" []) [] ~?= True,
                    "" ~: sonIguales (amigosDe "a" [("a","b")]) ["b"] ~?= True,
                    "" ~: sonIguales (amigosDe "a" [("a","b"),("c","d")]) ["b"] ~?= True,
                    "" ~: sonIguales (amigosDe "a" [("a","b"),("c","a")]) ["b","c"] ~?= True,
                    "" ~: sonIguales (amigosDe "b" [("a","b"),("b","c")]) ["a","c"] ~?= True,
                    "" ~: sonIguales (amigosDe "a" [("a","b"),("c","d"),("c","a")]) ["b","c"] ~?= True,
                    "" ~: sonIguales (amigosDe "b" [("a","b"),("c","d"),("e","b")]) ["a","e"] ~?= True
                    ]

personaConMasAmigosTests = TestList [
                    "" ~: personaConMasAmigos [("a","b")] ~?= "a",
                    "" ~: personaConMasAmigos [("a","b"),("b","c")] ~?= "b",
                    "" ~: personaConMasAmigos [("a","c"),("b","c")] ~?= "c",
                    "" ~: personaConMasAmigos [("a","b"),("c","d"),("d","e")] ~?= "d"
                    ]


testList = TestList [menorDivisorTests, esPrimoTests, relacionesValidasTests, personasTests, amigosDeTests, personaConMasAmigosTests]

quitar x (y:ys) | x == y = ys | otherwise = y: quitar x ys
incluido [] l = True
incluido (x:c) l = elem x l && incluido c (quitar x l)
sonIguales xs ys = incluido xs ys && incluido ys xs

main = runTestTT testList

