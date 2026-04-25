USE HACKERRANK;

IF OBJECT_ID('dbo.Hackers', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.Hackers;
END;

IF OBJECT_ID('dbo.Submissions', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.Submissions;
END;

CREATE TABLE Hackers (
    hacker_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE Submissions (
    submission_id INT PRIMARY KEY,
    hacker_id INT NOT NULL,
    challenge_id INT NOT NULL,
    score INT NOT NULL,
    FOREIGN KEY (hacker_id) REFERENCES Hackers(hacker_id)
);

INSERT INTO
    Hackers (hacker_id, name)
VALUES
    (4071, 'Rose'),
    (4806, 'Angela'),
    (26071, 'Frank'),
    (49438, 'Patrick'),
    (74842, 'Lisa'),
    (80305, 'Kimberly'),
    (84072, 'Bonnie'),
    (87868, 'Michael'),
    (92118, 'Todd'),
    (95895, 'Joe');

INSERT INTO
    Submissions (submission_id, hacker_id, challenge_id, score)
VALUES
    (67194, 74842, 63132, 76),
    (64479, 74842, 19797, 98),
    (40742, 26071, 49593, 20),
    (17513, 4806, 49593, 32),
    (69846, 80305, 19797, 19),
    (41002, 26071, 89343, 36),
    (52826, 49438, 49593, 9),
    (31093, 26071, 19797, 2),
    (81614, 84072, 49593, 100),
    (44829, 26071, 89343, 17),
    (75147, 80305, 49593, 48),
    (14115, 4806, 49593, 76),
    (6943, 4071, 19797, 95),
    (12855, 4806, 25917, 13),
    (73343, 80305, 49593, 42),
    (84264, 84072, 63132, 0),
    (9951, 4071, 49593, 43),
    (45104, 49438, 25917, 34),
    (53795, 74842, 19797, 5),
    (26363, 26071, 19797, 29),
    (10063, 4071, 49593, 96);