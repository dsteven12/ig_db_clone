-- FINDING 5 OLDEST USERS
-- SELECT username, created_at
-- FROM users 
-- ORDER BY 2 
-- LIMIT 5;

-- DAY OF THE WEEK DO MOST USERS REGISTER ON
-- SELECT 
--     DAYNAME(created_at) AS DAY, 
--     COUNT(*) AS NUMBER_OF_USERS
-- FROM users 
-- GROUP BY DAY
-- ORDER BY 2 DESC;

-- FIND THE USERS WHO HAVE NEVER POSTED A PHOTO
SELECT 
    username, 
    IFNULL(photos.id, 'NO') AS 'PHOTO?'
FROM users 
LEFT JOIN photos
    ON users.id = photos.user_id
WHERE photos.id IS NULL;