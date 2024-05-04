import Test.HUnit
import Parcial1

main = runTestTT tests

tests = test [
        "una relacion valida" ~: (relacionesValidas [("ana", "pedro")]) ~?= True,
        "componentes repetidas" ~: (relacionesValidas [("ana", "ana")]) ~?= False,
        "tupla repetida" ~: (relacionesValidas [("ana", "pedro"), ("ana", "pedro")]) ~?= False,
        "tupla repetida invertida" ~: (relacionesValidas [("ana", "pedro"), ("pedro", "ana")]) ~?= False,
        "todas diferentes" ~: (relacionesValidas [("ana", "pedro"), ("ana", "carlos")]) ~?= True,
        "" ~: (relacionesValidas [("ana", "pedro"), ("ana", "carlos"), ("pedro", "ana")]) ~?= False,

        "" ~: (personas []) ~?= [],
        "" ~: (personas [("ana", "pedro")]) ~?= ["ana", "pedro"],

        "" ~: (amigosDe "ana" []) ~?= [],
        "" ~: (amigosDe "ana" [("juan", "pedro"), ("juan", "carlos")]) ~?= [],
        "" ~: (amigosDe "ana" [("ana", "pedro"), ("juan", "ana")]) ~?= ["pedro", "juan"],

        "" ~: (personaConMasAmigos [("ana", "pedro"), ("juan", "ana")]) ~?= "ana",
        "" ~: (personaConMasAmigos [("ana", "pedro"), ("juan", "ana"), ("pedro", "carlos")]) ~?= "pedro"
        ]