# FEJLESZTÉSI TESZTELÉSI JEGYZŐKÖNYV

## Komponensteszt


## TESZTELÉSI ELVÁRÁSOK
Funkcionális
- Adatbázis funkciók
- Tárolt eljárások működése

## ADATBÁZIS TESZTELÉS:


A database.sql és a storedProcedures.sql fileok futtatása a mySQL szerveren. Ezt követően ellenőrizni kellett, hogy a futás nem dobott hibát és minden adattábla és tárolt eljárás hibátlanul létrejött.

## ELJÁRÁSOK TESZTELÉSE:

phpMyAdmin felületén, eljrások menüpont alatt van lehetőség futtatni a tárolt eljárásokat. Itt teszt adatokat megadva lehet tesztelni a helyes működést. 

## Tesztelt eljárások:
- registerUser()
- addEvent()
- addCategory()
- registerToEvent()
- unRegister()
- registerVisit()
- userDataChange()
- userDetails()
- eventDetails()
- listEvents()
- listEvents()
- listUsers()
- userLogin()

A tesztek a várt adatokat szolgáltatták.


A teszt sikeresen zárult, minden funkció megfelelően működik.



2022.04.30.