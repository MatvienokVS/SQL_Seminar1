use vk;

SELECT status, COUNT(*) AS count_of_requests
FROM friend_requests
GROUP BY status;