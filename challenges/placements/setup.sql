USE HACKERRANK;

CREATE TABLE Students (
    ID INT NOT NULL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL
);

CREATE TABLE Friends (
    ID INT NOT NULL PRIMARY KEY,
    Friend_ID INT NOT NULL,
    CONSTRAINT FK_Friends_Student FOREIGN KEY (ID) REFERENCES Students(ID),
    CONSTRAINT FK_Friends_Friend FOREIGN KEY (Friend_ID) REFERENCES Students(ID)
);

CREATE TABLE Packages (
    ID INT NOT NULL PRIMARY KEY,
    Salary FLOAT NOT NULL,
    CONSTRAINT FK_Packages_Student FOREIGN KEY (ID) REFERENCES Students(ID)
);

INSERT INTO Students (ID, Name) VALUES (1, 'Ashley');
INSERT INTO Students (ID, Name) VALUES (2, 'Samantha');
INSERT INTO Students (ID, Name) VALUES (3, 'Julia');
INSERT INTO Students (ID, Name) VALUES (4, 'Scarlet');

INSERT INTO Packages (ID, Salary) VALUES (1, 15.20);
INSERT INTO Packages (ID, Salary) VALUES (2, 10.06);
INSERT INTO Packages (ID, Salary) VALUES (3, 11.55);
INSERT INTO Packages (ID, Salary) VALUES (4, 12.12);

INSERT INTO Friends (ID, Friend_ID) VALUES (1, 2);
INSERT INTO Friends (ID, Friend_ID) VALUES (2, 3);
INSERT INTO Friends (ID, Friend_ID) VALUES (3, 4);
INSERT INTO Friends (ID, Friend_ID) VALUES (4, 1);