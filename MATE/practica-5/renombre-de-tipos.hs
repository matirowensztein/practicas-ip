-- 1
type Punto2D = (Float, Float)

prodInt :: Punto2D -> Punto2D -> Float
prodInt (a, b) (c, d) = a * b + c * d

todoMenor :: Punto2D -> Punto2D -> Bool
todoMenor (a, b) (c, d) = a < c && b < d

distanciaPuntos :: Punto2D -> Punto2D -> Float
distanciaPuntos (a, b) (c, d) = sqrt ((a - c) ** 2 + (b - d) ** 2)

type Coordenada = (Float, Float)

crearPar :: Float -> Float -> Coordenada
crearPar a b = (a, b)

-- 2
type Año = Integer

type EsMultiplo = Bool

type EsBisiesto = Bool

esMultiplo :: Año -> Año -> EsMultiplo
esMultiplo x y = x `mod` y == 0

bisiesto :: Año -> EsBisiesto
bisiesto n =
  (n `esMultiplo` 4)
    && (not (n `esMultiplo` 100) || (n `esMultiplo` 400))

-- 3
type Coordenada3d = (Float, Float, Float)

distanciaManhattan :: Coordenada3d -> Coordenada3d -> Float
distanciaManhattan (p1, p2, p3) (q1, q2, q3) =
  abs (p1 - q1) + abs (p2 - q2) + abs (p3 - q3)

-- 4
type Texto = [Char]

type Nombre = Texto

type Telefono = Texto

type Contacto = (Nombre, Telefono)

type ContactosTel = [Contacto]

elNombre :: Contacto -> Nombre
elNombre contacto = fst contacto

elTelefono :: Contacto -> Telefono
elTelefono contacto = snd contacto

enLosContactos :: Nombre -> ContactosTel -> Bool
enLosContactos _ [] = False
enLosContactos nombre (c : cs) = nombre == elNombre c || enLosContactos nombre cs

actualizarTelefono :: Nombre -> Telefono -> ContactosTel -> ContactosTel
actualizarTelefono nombre telefono (contacto : contactos)
  | elNombre contacto == nombre = (nombre, telefono) : contactos
  | otherwise = [contacto] ++ actualizarTelefono nombre telefono contactos

agregarContacto :: Contacto -> ContactosTel -> ContactosTel
agregarContacto contacto contactos
  | enLosContactos (elNombre contacto) contactos = actualizarTelefono (elNombre contacto) (elTelefono contacto) contactos
  | otherwise = contacto : contactos

eliminarContacto :: Nombre -> ContactosTel -> ContactosTel
eliminarContacto _ [] = []
eliminarContacto nombre (c : cs)
  | nombre == elNombre c = cs
  | otherwise = [c] ++ eliminarContacto nombre cs

-- 5
type Identificacion = Integer

type Ubicacion = Texto

type Estado = (Disponibilidad, Ubicacion)

type Locker = (Identificacion, Estado)

type MapaDeLockers = [Locker]

data Disponibilidad = Libre | Ocupado deriving (Eq, Show)

identificacionDeLocker :: Locker -> Identificacion
identificacionDeLocker locker = fst locker

disponibilidadDeLocker :: Locker -> Disponibilidad
disponibilidadDeLocker locker = fst (snd locker)

ubicacionDeLocker' :: Locker -> Ubicacion
ubicacionDeLocker' locker = snd (snd locker)

existeElLocker :: Identificacion -> MapaDeLockers -> Bool
existeElLocker _ [] = False
existeElLocker identificacion (l : ls)
  | identificacion == identificacionDeLocker l = True
  | otherwise = existeElLocker identificacion ls

ubicacionDeLocker :: Identificacion -> MapaDeLockers -> Ubicacion
ubicacionDeLocker _ [] = ""
ubicacionDeLocker identificacion (l : ls)
  | identificacion == identificacionDeLocker l = ubicacionDeLocker' l
  | otherwise = ubicacionDeLocker identificacion ls

estaDisponibleElLocker :: Identificacion -> MapaDeLockers -> Bool
estaDisponibleElLocker _ [] = False
estaDisponibleElLocker identificacion (l : ls)
  | identificacion == identificacionDeLocker l = disponibilidadDeLocker l == Libre
  | otherwise = estaDisponibleElLocker identificacion ls

ocuparLocker :: Identificacion -> MapaDeLockers -> MapaDeLockers
ocuparLocker _ [] = []
ocuparLocker identificacion (l : ls)
  | identificacion == identificacionDeLocker l = [(fst l, (Ocupado, snd (snd l)))] ++ ls
  | otherwise = [l] ++ ocuparLocker identificacion ls
