DROP FUNCTION IF EXISTS login;
CREATE FUNCTION login (userId VARCHAR(6), userPass VARCHAR(32)) RETURNS BOOLEAN
BEGIN
    DECLARE loggedCount INT;
    SELECT count(userName) into loggedCount FROM UserTable WHERE  id = userId AND userPassword = userPass;
    return loggedCount = 1;
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