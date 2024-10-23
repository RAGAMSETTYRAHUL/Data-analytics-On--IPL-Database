CREATE DATABASE ipl;
USE ipl;

CREATE TABLE teams (
    team_id INT PRIMARY KEY AUTO_INCREMENT,
    team_name VARCHAR(50) NOT NULL,
    home_ground VARCHAR(50),
    coach VARCHAR(50)
);

CREATE TABLE players (
    player_id INT PRIMARY KEY AUTO_INCREMENT,
    player_name VARCHAR(50) NOT NULL,
    age INT,
    role VARCHAR(50),  -- e.g., Batsman, Bowler, All-Rounder, Wicketkeeper
    team_id INT,
    FOREIGN KEY (team_id) REFERENCES teams(team_id)
);

CREATE TABLE matches (
    match_id INT PRIMARY KEY AUTO_INCREMENT,
    match_date DATE,
    venue VARCHAR(50),
    team1_id INT,
    team2_id INT,
    winner_team_id INT,
    FOREIGN KEY (team1_id) REFERENCES teams(team_id),
    FOREIGN KEY (team2_id) REFERENCES teams(team_id),
    FOREIGN KEY (winner_team_id) REFERENCES teams(team_id)
);

CREATE TABLE performance (
    performance_id INT PRIMARY KEY AUTO_INCREMENT,
    match_id INT,
    player_id INT,
    runs_scored INT,
    wickets_taken INT,
    catches INT,
    FOREIGN KEY (match_id) REFERENCES matches(match_id),
    FOREIGN KEY (player_id) REFERENCES players(player_id)
);

INSERT INTO teams (team_name, home_ground, coach)
VALUES 
('Mumbai Indians', 'Wankhede Stadium', 'Mahela Jayawardene'),
('Chennai Super Kings', 'M. A. Chidambaram Stadium', 'Stephen Fleming'),
('Royal Challengers Bangalore', 'M. Chinnaswamy Stadium', 'Sanjay Bangar'),
('Delhi Capitals', 'Arun Jaitley Stadium', 'Ricky Ponting');

INSERT INTO players (player_name, age, role, team_id)
VALUES
('Rohit Sharma', 34, 'Batsman', 1),
('Jasprit Bumrah', 28, 'Bowler', 1),
('Virat Kohli', 33, 'Batsman', 3),
('MS Dhoni', 40, 'Wicketkeeper', 2),
('Ravindra Jadeja', 32, 'All-Rounder', 2),
('Rishabh Pant', 24, 'Wicketkeeper', 4),
('Shikhar Dhawan', 36, 'Batsman', 4);

INSERT INTO matches (match_date, venue, team1_id, team2_id, winner_team_id)
VALUES
('2023-04-05', 'Wankhede Stadium', 1, 2, 1),
('2023-04-10', 'M. A. Chidambaram Stadium', 2, 3, 2),
('2023-04-15', 'M. Chinnaswamy Stadium', 3, 4, 3),
('2023-04-20', 'Arun Jaitley Stadium', 4, 1, 1);


INSERT INTO performance (match_id, player_id, runs_scored, wickets_taken, catches)
VALUES
(1, 1, 85, 0, 2),  -- Rohit Sharma scored 85 runs
(1, 2, 0, 3, 1),   -- Jasprit Bumrah took 3 wickets
(2, 5, 45, 1, 1),  -- Ravindra Jadeja scored 45 runs, took 1 wicket
(3, 3, 70, 0, 1),  -- Virat Kohli scored 70 runs
(4, 6, 50, 0, 2);  -- Rishabh Pant scored 50 runs



