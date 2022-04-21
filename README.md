## Adatbázisterv:
**UserTable:**

A felhasználók adatainak tárolására használjuk.

|Mezőnév:|Típus:|Megkötés:|Kulcs-e:|Leírás:|
|:-------|:-----|:--------|:-------|:------|
|id|VARCHAR(6)|Not Null|Elsődleges Kulcs|A felhasználó egyedi azonosítója (neptun kód)|
|mail|VARCHAR(50)|Not Null||A felhasználó e-mail címe|
|userPassword|VARCHAR(32)|Not Null||A felhasználó jelszavának a hash-e|
|userName|VARCHAR(70)|Not Null||A felhasználó neve|

**Events:**

A sportesemények adatinak tárolására használjuk.

|Mezőnév:|Típus:|Megkötés:|Kulcs-e:|Leírás:|
|:-------|:-----|:--------|:-------|:------|
|id|INT|Not Null|Elsődleges Kulcs|Az esemény egyedi azonosítója|
|title|VARCHAR(50)|Not Null||Az esemény neve|
|startTime|TIMESTAMP|Not Null||Az esemény időpontja|
|regTime|TIMESTAMP|Not Null||Eddig az időpontig lehet jelentkezni|
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
registerToEvent(userID,eventID) -regisztrálja a felhasználót az eseményre

login(userID, password) - bejelentkezteti a felhasználót 

unRegister(userID,eventID) - törli a felhasználó regisztrációját

listEvents(dateFrom, dateTo) - listázza az eseményeket (opcionális paraméterek, időpontok közötti versenyekt ad vissza)

eventDetails(evetnID) - esemény adatait adja vissza

registerVisit(userID,eventID,place) - elmenti a felhasználó eredményét egy adott eseményen

userDetails(userID) - felhasználó adatainak lekérdezése

userPasswordChange(userID, password) - elfelejtett jelszó esetén jelszó csere

userDataChange(userID, name,mail) -felhasználó adatainak változtatása
