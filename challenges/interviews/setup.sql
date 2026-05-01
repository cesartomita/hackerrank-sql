USE HACKERRANK;

CREATE TABLE Contests (
    contest_id INT NOT NULL PRIMARY KEY,
    hacker_id  INT NOT NULL,
    name       VARCHAR(100) NOT NULL
);

CREATE TABLE Colleges (
    college_id INT NOT NULL PRIMARY KEY,
    contest_id INT NOT NULL
);

CREATE TABLE Challenges (
    challenge_id INT NOT NULL PRIMARY KEY,
    college_id   INT NOT NULL
);

CREATE TABLE View_Stats (
    challenge_id       INT NOT NULL,
    total_views        INT NOT NULL,
    total_unique_views INT NOT NULL
);

CREATE TABLE Submission_Stats (
    challenge_id               INT NOT NULL,
    total_submissions          INT NOT NULL,
    total_accepted_submissions INT NOT NULL
);

INSERT INTO Contests (contest_id, hacker_id, name) VALUES (66406, 17973, 'Rose');
INSERT INTO Contests (contest_id, hacker_id, name) VALUES (66556, 79153, 'Angela');
INSERT INTO Contests (contest_id, hacker_id, name) VALUES (94828, 80275, 'Frank');

INSERT INTO Colleges (college_id, contest_id) VALUES (11219, 66406);
INSERT INTO Colleges (college_id, contest_id) VALUES (32473, 66556);
INSERT INTO Colleges (college_id, contest_id) VALUES (56685, 94828);

INSERT INTO Challenges (challenge_id, college_id) VALUES (18765, 11219);
INSERT INTO Challenges (challenge_id, college_id) VALUES (47127, 11219);
INSERT INTO Challenges (challenge_id, college_id) VALUES (60292, 32473);
INSERT INTO Challenges (challenge_id, college_id) VALUES (72974, 56685);

INSERT INTO View_Stats (challenge_id, total_views, total_unique_views) VALUES (47127, 26, 19);
INSERT INTO View_Stats (challenge_id, total_views, total_unique_views) VALUES (47127, 15, 14);
INSERT INTO View_Stats (challenge_id, total_views, total_unique_views) VALUES (18765, 43, 10);
INSERT INTO View_Stats (challenge_id, total_views, total_unique_views) VALUES (18765, 72, 13);
INSERT INTO View_Stats (challenge_id, total_views, total_unique_views) VALUES (75516, 35, 17);
INSERT INTO View_Stats (challenge_id, total_views, total_unique_views) VALUES (60292, 11, 10);
INSERT INTO View_Stats (challenge_id, total_views, total_unique_views) VALUES (72974, 41, 15);
INSERT INTO View_Stats (challenge_id, total_views, total_unique_views) VALUES (75516, 75, 11);

INSERT INTO Submission_Stats (challenge_id, total_submissions, total_accepted_submissions) VALUES (75516, 34, 12);
INSERT INTO Submission_Stats (challenge_id, total_submissions, total_accepted_submissions) VALUES (47127, 27, 10);
INSERT INTO Submission_Stats (challenge_id, total_submissions, total_accepted_submissions) VALUES (47127, 56, 18);
INSERT INTO Submission_Stats (challenge_id, total_submissions, total_accepted_submissions) VALUES (75516, 74, 12);
INSERT INTO Submission_Stats (challenge_id, total_submissions, total_accepted_submissions) VALUES (75516, 83, 8);
INSERT INTO Submission_Stats (challenge_id, total_submissions, total_accepted_submissions) VALUES (72974, 68, 24);
INSERT INTO Submission_Stats (challenge_id, total_submissions, total_accepted_submissions) VALUES (72974, 82, 14);
INSERT INTO Submission_Stats (challenge_id, total_submissions, total_accepted_submissions) VALUES (47127, 28, 11);