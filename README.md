## Adatbázisterv:
**User:**

A felhasználók adatainak tárolására használjuk.

|Mezőnév:|Típus:|Megkötés:|Kulcs-e:|Leírás:|
|:-------|:-----|:--------|:-------|:------|
|Id|Varchar2(32)|Not Null|Elsődleges Kulcs|A felhasználó egyedi azonosítója (neptun kód)|
|Mail|Varchar2(50)|Not Null||A felhasználó e-mail címe|
|Password|Varchar2(32)|Not Null||A felhasználó jelszavának a hash-e|
|Name|Varchar2(70)|Not Null||A felhasználó neve|

**Events:**

A sportesemények adatinak tárolására használjuk.

|Mezőnév:|Típus:|Megkötés:|Kulcs-e:|Leírás:|
|:-------|:-----|:--------|:-------|:------|
|Id|Numeric|Not Null|Elsődleges Kulcs|Az esemény egyedi azonosítója|
|Title|Varchar2(50)|Not Null||Az esemény neve|
|StartTime|Timestamp|Not Null||Az esemény időpontja|
|RegTime|TimeStamp|Not Null||Eddig az időpontig lehet jelentkezni|
|Category|Numeric|Not NuLL|Idegen kulcs (A Categories tábla Id mezőjéhez kapcsolva)|Az esemény kategóriája|

**Categories:**

A sportesemények kategórái.

|Mezőnév:|Típus:|Megkötés:|Kulcs-e:|Leírás:|
|:-------|:-----|:--------|:-------|:------|
|Id|Numeric|Not Null|Elsődleges Kulcs|A kategória egyedi azonosítója|
|Name|Varchar2(50)|Not Null||A kategória neve|


**UserRegisters:**

Felhasználók jelentkezései az eseményekre.

|Mezőnév:|Típus:|Megkötés:|Kulcs-e:|Leírás:|
|:-------|:-----|:--------|:-------|:------|
|userId|Varchar2(32)|Not Null|Idegen kulcs (Events tábla Id mezőjéhez kapcsolva)|A felhasználó egyedi azonosítója (neptun kód)|
|eventId|Numeric|Not Null|Idegen kulcs (Events tábla Id mezőjéhez kapcsolva)|Az esemény egyedi azonosítója|

**UserVisit:**

A felhasználók meglátogatott eseményei, és az azon elért eredményei

|Mezőnév:|Típus:|Megkötés:|Kulcs-e:|Leírás:|
|:-------|:-----|:--------|:-------|:------|
|userId|Varchar2(32)|Not Null|Idegen kulcs (Events tábla Id mezőjéhez kapcsolva)|A felhasználó egyedi azonosítója (neptun kód)|
|eventId|Numeric|Not Null|Idegen kulcs (Events tábla Id mezőjéhez kapcsolva)|Az esemény egyedi azonosítója|
|Place|Numeric|||A felhasználó által, az eseményen elért eredmény|


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
