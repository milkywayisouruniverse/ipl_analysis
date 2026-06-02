#Top teams by win 
SELECT winner,
       COUNT(*) AS total_wins
FROM matches
WHERE winner IS NOT NULL
GROUP BY winner
ORDER BY total_wins DESC;
##Team Win Percentage
SELECT winner,
       COUNT(*) AS wins,
       ROUND(COUNT(*) * 100.0 /
             (SELECT COUNT(*) FROM matches WHERE winner IS NOT NULL),2)
       AS win_percentage
FROM matches
WHERE winner IS NOT NULL
GROUP BY winner
ORDER BY wins DESC;

#top 10 scores 
SELECT batter,
       SUM(batsman_runs) AS total_runs
FROM deliveries
GROUP BY batter
ORDER BY total_runs DESC
LIMIT 10;
#top 10 wicket keppers 
SELECT bowler,
       SUM(is_wicket) AS wickets
FROM deliveries
GROUP BY bowler
ORDER BY wickets DESC
LIMIT 10;
#most player of the match
SELECT player_of_match,
       COUNT(*) AS awards
FROM matches
GROUP BY player_of_match
ORDER BY awards DESC
LIMIT 10;
#most sixes 
SELECT batter,
       COUNT(*) AS sixes
FROM deliveries
WHERE batsman_runs = 6
GROUP BY batter
ORDER BY sixes DESC
LIMIT 10;
#most fours 
SELECT batter,
       COUNT(*) AS fours
FROM deliveries
WHERE batsman_runs = 4
GROUP BY batter
ORDER BY fours DESC
LIMIT 10;
#highest team scores
SELECT match_id,
       inning,
       SUM(total_runs) AS score
FROM deliveries
GROUP BY match_id, inning
ORDER BY score DESC
LIMIT 10;
#lowest team scores
SELECT match_id,
       inning,
       SUM(total_runs) AS score
FROM deliveries
GROUP BY match_id, inning
ORDER BY score ASC
LIMIT 10;
#toss winner , plus actual winner
SELECT COUNT(*) AS matches_where_toss_helped
FROM matches
WHERE toss_winner = winner;
#highest team score
SELECT match_id,
       inning,
       SUM(total_runs) AS score
FROM deliveries
GROUP BY match_id, inning
ORDER BY score DESC
LIMIT 10;
#lowest team score 
SELECT match_id,
       inning,
       SUM(total_runs) AS score
FROM deliveries
GROUP BY match_id, inning
ORDER BY score ASC
LIMIT 10;
#toss vs actual winner
SELECT COUNT(*) AS matches_where_toss_helped
FROM matches
WHERE toss_winner = winner;
#Toss Decision Analysis
SELECT toss_decision,
       COUNT(*) AS frequency
FROM matches
GROUP BY toss_decision;
#most matched played by the teams
SELECT team,
       COUNT(*) AS matches_played
FROM
(
    SELECT team1 AS team FROM matches
    UNION ALL
    SELECT team2 AS team FROM matches
) t
GROUP BY team
ORDER BY matches_played DESC;
#best bowling figure
SELECT bowler,
       match_id,
       SUM(is_wicket) AS wickets
FROM deliveries
GROUP BY bowler, match_id
ORDER BY wickets DESC
LIMIT 10;
#orange cap analysis
SELECT m.season,
       d.batter,
       SUM(d.batsman_runs) AS runs
FROM deliveries d
JOIN matches m
ON d.match_id = m.id
GROUP BY m.season, d.batter
ORDER BY m.season, runs DESC;
#purple cap analysis
SELECT m.season,
       d.bowler,
       SUM(d.is_wicket) AS wickets
FROM deliveries d
JOIN matches m
ON d.match_id = m.id
GROUP BY m.season, d.bowler
ORDER BY m.season, wickets DESC;

