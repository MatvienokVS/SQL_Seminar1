use vk;

SELECT gender, SUM(likes) AS total_likes
FROM users
GROUP BY gender
ORDER BY total_likes DESC
LIMIT 1;

