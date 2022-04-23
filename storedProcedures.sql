DELIMITER |
USE sprot_event_orgainzer_db |

CREATE OR REPLACE FUNCTION userLogin(userId VARCHAR(6), userPass VARCHAR(32)) RETURNS BOOLEAN
BEGIN
    DECLARE loggedCount INT;
    SELECT count(userName) into loggedCount FROM UserTable WHERE  id = userId AND userPassword = userPass;
    return loggedCount = 1;
END | 

CREATE OR REPLACE FUNCTION listUsers() RETURNS JSON
BEGIN
	DECLARE userList JSON;
    SELECT CONCAT("[", GROUP_CONCAT( JSON_OBJEcT('id' , id,'Name' , userName, 'level', level)), "]" )  INTO userList from UserTable;
    RETURN userList;
END |

CREATE OR REPLACE FUNCTION listCategories() RETURNS JSON
BEGIN
	DECLARE categoryList JSON;
    SELECT CONCAT("[", GROUP_CONCAT( JSON_OBJEcT('id' , id,'Name' , name)), "]" )  INTO categoryList from Categories;
    RETURN categoryList;
END |

CREATE OR REPLACE FUNCTION listEvents(timeFrom DATETIME, timeTo DATETIME) RETURNS JSON
BEGIN
	DECLARE eventList JSON;
	SELECT CONCAT("[", GROUP_CONCAT( JSON_OBJECT('id' , id,'title' , title, 'startTime', startTime, 'regTime', regTime, 'category', category) ), "]" ) into eventList from Events
    WHERE (timeFrom is NULL OR timeFrom < startTime)AND(timeTo IS NULL OR timeTo > startTime);
    RETURN eventList;
END |

CREATE OR REPLACE FUNCTION eventDetails(eventid INT) RETURNS JSON
BEGIN
	DECLARE eventD JSON;
	SELECT CONCAT("[", GROUP_CONCAT( JSON_OBJECT('id' , id,'title' , title, 'startTime', startTime, 'regTime', regTime, 'category', category) ), "]" ) into eventD from Events
    WHERE eventiD = id;
    RETURN eventD;
END |

CREATE OR REPLACE FUNCTION userDetails(userid INT) RETURNS JSON
BEGIN
	DECLARE userD JSON;
	SELECT CONCAT("[", GROUP_CONCAT( JSON_OBJECT('id' , id,'Name' , userName, 'mail', mail, 'level', level) ), "]" ) into userD from UserTable
    WHERE userid = id;
    RETURN userD;
END |

CREATE OR REPLACE PROCEDURE registerToEvent(IN userId VARCHAR(6), eventId INT) 
BEGIN
    INSERT INTO UserRegisters VALUES (suerID, eventId);
END |

CREATE OR REPLACE PROCEDURE registerUser(IN userId VARCHAR(6), mail VARCHAR(50), userPass VARCHAR(32), userName VARCHAR(70), level INT) 
BEGIN
    INSERT INTO UserTable VALUES (userId, level, mail,userPass,userName);
END |

CREATE OR REPLACE PROCEDURE unRegister(IN userId VARCHAR(6), eventId INT) 
BEGIN
    DELETE FROM UserRegisters WHERE UserRegisters.userId = userId AND UserRegisters.eventId = eventId;
END |

CREATE OR REPLACE PROCEDURE registerVisit(IN userId VARCHAR(6), eventId INT, place INT) 
BEGIN
    INSERT INTO UserVisit VALUES (userId, eventId,place);
END |

CREATE OR REPLACE PROCEDURE registerEvent(IN title VARCHAR(50), startTime DATETIME, regTime DATETIME, category INT) 
BEGIN
    INSERT INTO Events (title, startTime, regTime, category) VALUES (title, startTime, regTime, category);
END |

CREATE OR REPLACE PROCEDURE addCategory(IN name VARCHAR(50)) 
BEGIN
    INSERT INTO Categories (name) VALUES (name);
END |

CREATE OR REPLACE PROCEDURE userDataChange(IN userId VARCHAR(6), mail VARCHAR(50), userPass VARCHAR(32), userName VARCHAR(70), level INT) 
BEGIN
    UPDATE UserTable  set UserTable.id = userId,UserTable.level = level, UserTable.mail = mail, UserTable.userpassword = userPass, UserTable.userName = userName WHERE UserTable.id = userId ;
END 