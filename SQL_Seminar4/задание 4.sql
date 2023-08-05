use vk;

SELECT SUM(likes) AS total_likes_under_18
FROM users
WHERE age < 18;