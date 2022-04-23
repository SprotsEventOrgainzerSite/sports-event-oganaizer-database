## Adatbázisterv:
**UserTable:**

A felhasználók adatainak tárolására használjuk.

|Mezőnév:|Típus:|Megkötés:|Kulcs-e:|Leírás:|
|:-------|:-----|:--------|:-------|:------|
|id|VARCHAR(6)|Not Null|Elsődleges Kulcs|A felhasználó egyedi azonosítója (neptun kód)|
|level|INT|Not Null||A felhasználó szintje, 0-diák, 1-tanár|
|mail|VARCHAR(50)|Not Null||A felhasználó e-mail címe|
|userPassword|VARCHAR(32)|Not Null||A felhasználó jelszavának a hash-e|
|userName|VARCHAR(70)|Not Null||A felhasználó neve|

**Events:**

A sportesemények adatinak tárolására használjuk.

|Mezőnév:|Típus:|Megkötés:|Kulcs-e:|Leírás:|
|:-------|:-----|:--------|:-------|:------|
|id|INT|Not Null|Elsődleges Kulcs|Az esemény egyedi azonosítója|
|title|VARCHAR(50)|Not Null||Az esemény neve|
|startTime|DATETIME|Not Null||Az esemény időpontja|
|regTime|DATETIME|Not Null||Eddig az időpontig lehet jelentkezni|
|category|INT|Not NuLL|Idegen kulcs (A Categories tábla Id mezőjéhez kapcsolva)|Az esemény kategóriája|

**Categories:**

A sportesemények kategórái.

|Mezőnév:|Típus:|Megkötés:|Kulcs-e:|Leírás:|
|:-------|:-----|:--------|:-------|:------|
|id|INT|Not Null|Elsődleges Kulcs|A kategória egyedi azonosítója|
|name|VARCHAR(50)|Not Null||A kategória neve|


**UserRegisters:**

Felhasználók jelentkezései az eseményekre.

|Mezőnév:|Típus:|Megkötés:|Kulcs-e:|Leírás:|
|:-------|:-----|:--------|:-------|:------|
|userId|VARCHAR(6)|Not Null|Idegen kulcs (Events tábla Id mezőjéhez kapcsolva)|A felhasználó egyedi azonosítója (neptun kód)|
|eventId|INT|Not Null|Idegen kulcs (Events tábla Id mezőjéhez kapcsolva)|Az esemény egyedi azonosítója|

**UserVisit:**

A felhasználók meglátogatott eseményei, és az azon elért eredményei

|Mezőnév:|Típus:|Megkötés:|Kulcs-e:|Leírás:|
|:-------|:-----|:--------|:-------|:------|
|userId|VARCHAR(6)|Not Null|Idegen kulcs (Events tábla Id mezőjéhez kapcsolva)|A felhasználó egyedi azonosítója (neptun kód)|
|eventId|INT|Not Null|Idegen kulcs (Events tábla Id mezőjéhez kapcsolva)|Az esemény egyedi azonosítója|
|p lace|INT|||A felhasználó által, az eseményen elért eredmény|


## Tárolt eljárások:
Az adabázis a következő tárolt eljárásokat tartalmazza:

* registerUser:
    Új felhasználó felvitele a rendszerbe.
    Bemenő adatok:
    
    |Változó:|Típus:|Leírás:|
    |:-----|:-----------|:------|
    |userId|VARCHAR(6)|A felhasználó egyedi azonosítója. (neptun kód)|
    |mail|VARCHAR(50)|A felhasználó email címe|
    |userPass|VARCHAR(32)|A felhasználó jelszavának hash értéke|
    |userName|VARCHAR(70)|A felhasználó neve|
    |level|INT|A felhasználó szintje, 0-diák, 1-tanár|

* addEvent  
    Esemény létrehozása.
    Bemenő adatok:
    
    |Változó:|Típus:|Leírás:|
    |:-----|:-----------|:------|
    |title|VARCHAR(50)|Az esemény neve|
    |startTime|DATETIME|Az esemény kezdő időpontja|
    |regTime|DATETIME|Az az időpont ameddig lehet rá regisztrálni|
    |category|INT|Az esemény kategóriájának azonosítója|

* addCategory  
    Kategóris létrehozása.
    Bemenő adatok:
    
    |Változó:|Típus:|Leírás:|
    |:-----|:-----------|:------|
    |name|VARCHAR(50)|A kategória neve|
   
* registerToEvent  
    Felhasználó előzetes regisztrációja egy eseményhez
    Bemenő adatok:
    
    |Változó:|Típus:|Leírás:|
    |:-----|:-----------|:------|
    |userId|VARCHAR(6)|A regisztrálandó felhasználó azonosítója|
    |eventId|INT|Az esemény azonoítója|

* unRegister  
    Felhasználó előzetes regisztrációjánap törlése egy eseményről
    Bemenő adatok:
    
    |Változó:|Típus:|Leírás:|
    |:-----|:-----------|:------|
    |userId|VARCHAR(6)|A regisztrálandó felhasználó azonosítója|
    |eventId|INT|Az esemény azonoítója|
    
* registerVisit  
    Felhasználó részvételének regisztrációja egy eseményre
    Bemenő adatok:
    
    |Változó:|Típus:|Leírás:|
    |:-----|:-----------|:------|
    |userId|VARCHAR(6)|A regisztrálandó felhasználó azonosítója|
    |eventId|INT|Az esemény azonoítója|
    |place|INT|A felhasználó által elért eredmény|

* userDataChange  
    Felhasználó adatainak módosítása
    Bemenő adatok:
    
    |Változó:|Típus:|Leírás:|
    |:-----|:-----------|:------|
    |userId|VARCHAR(6)|A felhasználó egyedi azonosítója. (neptun kód)|
    |mail|VARCHAR(50)|A felhasználó email címe|
    |userPass|VARCHAR(32)|A felhasználó jelszavának hash értéke|
    |userName|VARCHAR(70)|A felhasználó neve|
    |level|INT|A felhasználó szintje, 0-diák, 1-tanár|

* userDetails  
    Egy felhasználó adatainak lekérdezése
    Bemenő adatok:
    
    |Változó:|Típus:|Leírás:|
    |:-----|:-----------|:------|
    |userId|VARCHAR(6)|A felhasználó egyedi azonosítója. (neptun kód)|
    
    Visszatérési érték:
    
    |Kulcs:|Leírás|
    |:-----|:------|
    |id|A felhasználó egyedi azonosítója|
    |name|A felhasználó neve|
    |mail|A felhasználó email címe|
    |level|A felhasználó szintje, 0-diák, 1-tanár|

* eventDetails  
    Egy esemény adatainak lekérdezése
    Bemenő adatok:
    
    |Változó:|Típus:|Leírás:|
    |:-----|:-----------|:------|
    |eventId|INT|Az esemény egyedi azonosítója.|
    
    Visszatérési érték:
    
    |Kulcs:|Leírás|
    |:-----|:------|
    |id|Az esemény egyedi azonosítója|
    |title|Az esemény elnevezése|
    |startTime|Az esemény kezdő időpontja|
    |regTime|Az az időpont ameddig lehet rá regisztrálni|
    |category|Az esemény kategóriájának azonosítója|

* listEvents  
    Események listájának lekérdezése (Listát ad vissza az eseményekről)
    Bemenő adatok:
    
    |Változó:|Típus:|Leírás:|
    |:-----|:-----------|:------|
    |timeFrom|DATETIME|Ettől az időponttól fog listázni (lehet NULL)|
    |timeTo|DATETIME|Eddig az időpontig fog listázni (lehet NULL)|
    
    Visszatérési érték:
    
    |Kulcs:|Leírás|
    |:-----|:------|
    |id|Az esemény egyedi azonosítója|
    |title|Az esemény elnevezése|
    |startTime|Az esemény kezdő időpontja|
    |regTime|Az az időpont ameddig lehet rá regisztrálni|
    |category|Az esemény kategóriájának azonosítója|

* listEvents  
    Kategóriák listájának lekérdezése (Listát ad vissza az eseményekről)
    Bemenő adatok:
    
    Nincs
    
    
    Visszatérési érték:
    
    |Kulcs:|Leírás|
    |:-----|:------|
    |id|Az kategória egyedi azonosítója|
    |name|Az kategória elnevezése|
    
* listUsers  
    Felhasználók listájának lekérdezése (Listát ad vissza az eseményekről)
    Bemenő adatok:
    
    Nincs
    
    
    Visszatérési érték:
    
    |Kulcs:|Leírás|
    |:-----|:------|
    |id|A felhasználó egyedi azonosítója|
    |name|A felhasználó neve|
    |mail|A felhasználó email címe|
    |level|A felhasználó szintje, 0-diák, 1-tanár|

* userLogin  
    Felhasználók azonosítása. Ez az egyetlen függvény meg nem JSON-t ad vissza hanem egyszerű bool értéket.
    Bemenő adatok:
    
    |Változó:|Típus:|Leírás:|
    |:-----|:-----------|:------|
    |userId|VARCHAR(6)|A felhasználó egyedi azonosítója. (neptun kód)|    
    |userPass|VARCHAR(32)|A felhasználó jelszavának hash értéke|    

    Visszatérési érték:
    
    |Kulcs:|Leírás|
    |:-----|:------|
    |-|0 esetén sikertelen az azonosítás 1 esetén sikeres|