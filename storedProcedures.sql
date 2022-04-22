DROP FUNCTION IF EXISTS login;
CREATE FUNCTION login (userId VARCHAR(6), userPass VARCHAR(32)) RETURNS BOOLEAN
BEGIN
    DECLARE loggedCount INT;
    SELECT count(userName) into loggedCount FROM UserTable WHERE  id = userId AND userPassword = userPass;
    return loggedCount = 1;
END

DROP FUNCTION IF EXISTS listUsers;
CREATE FUNCTION listUsers() RETURNS JSON
BEGIN
	DECLARE userList JSON;
    SELECT CONCAT("[", GROUP_CONCAT( JSON_OBJEcT('id' , id,'Név' , userName)), "]" )  INTO userList from UserTable;
    RETURN userList;
END


DROP FUNCTION IF EXISTS listEvents;
CREATE FUNCTION listEvents(timeFrom TIMESTAMP, timeTo TIMESTAMP) RETURNS JSON
BEGIN
	DECLARE eventList JSON;
	SELECT CONCAT("[", GROUP_CONCAT( JSON_OBJECT('id' , id,'title' , title, 'startTime', startTime, 'regTime', regTime, 'category', category) ), "]" ) into eventList from Events
    WHERE (timeFrom is NULL OR timeFrom < startTime)AND(timeTo IS NULL OR timeTo > startTime);
    RETURN eventList;
END

DROP FUNCTION IF EXISTS eventDetails;
CREATE FUNCTION eventDetails(eventid INT) RETURNS JSON
BEGIN
	DECLARE eventD JSON;
	SELECT CONCAT("[", GROUP_CONCAT( JSON_OBJECT('id' , id,'title' , title, 'startTime', startTime, 'regTime', regTime, 'category', category) ), "]" ) into eventD from Events
    WHERE eventiD = id;
    RETURN eventD;
END

DROP FUNCTION IF EXISTS userDetails;
CREATE FUNCTION userDetails(userid INT) RETURNS JSON
BEGIN
	DECLARE userD JSON;
	SELECT CONCAT("[", GROUP_CONCAT( JSON_OBJECT('id' , id,'Név' , userName, 'mail', mail) ), "]" ) into userD from UserTable
    WHERE userid = id;
    RETURN userD;
END

DROP PROCEDURE IF EXISTS registerToEvent;
CREATE PROCEDURE registerToEvent(IN userId VARCHAR(6), eventId INT) 
BEGIN
    INSERT INTO UserRegisters VALUES (suerID, eventId);
END

DROP PROCEDURE IF EXISTS registerUser;
CREATE PROCEDURE registerUser(IN userId VARCHAR(6), mail VARCHAR(50), userPass VARCHAR(32), userName VARCHAR(70)) 
BEGIN
    INSERT INTO UserTable VALUES (userId, mail,userPass,userName);
END

DROP PROCEDURE IF EXISTS unRegister;
CREATE PROCEDURE unRegister(IN userId VARCHAR(6), eventId INT) 
BEGIN
    DELETE FROM UserRegisters WHERE UserRegisters.userId = userId AND UserRegisters.eventId = eventId;
END

DROP PROCEDURE IF EXISTS registerVisit;
CREATE PROCEDURE registerVisit(IN userId VARCHAR(6), eventId INT, place INT) 
BEGIN
    INSERT INTO UserVisit VALUES (suerID, eventId,place);
END

DROP PROCEDURE IF EXISTS userDataChange;
CREATE PROCEDURE userDataChange(IN userId VARCHAR(6), mail VARCHAR(50), userPass VARCHAR(32), userName VARCHAR(70)) 
BEGIN
    UPDATE UserTable  set UserTable.id = userId, UserTable.mail = mail, UserTable.userpassword = userPass, UserTable.userName = userName);
END