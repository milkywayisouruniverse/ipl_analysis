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
