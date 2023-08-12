use vk;

SELECT COUNT(*) AS count_men
FROM profiles
WHERE gender = 'm' AND birthday > 35;
