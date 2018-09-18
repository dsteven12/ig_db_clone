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
-- SELECT 
--     username, 
--     IFNULL(photos.id, 'NO') AS 'PHOTO?'
-- FROM users 
-- LEFT JOIN photos
--     ON users.id = photos.user_id
-- WHERE photos.id IS NULL;

-- IDENTIFY MOST POPULAR PHOTO
-- SELECT 
--     username,
--     image_url, 
--     COUNT(*) AS Total
-- FROM photos 
-- INNER JOIN likes 
--     ON photos.id = likes.photo_id
-- INNER JOIN users
--     ON users.id = photos.user_id
-- GROUP BY photos.id
-- ORDER BY Total DESC
-- LIMIT 5;

-- AVERAGE POSTS PER USER
-- SELECT (SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users) AS AVG;

-- TOP 5 MOST COMMONLY USED HASHTAGS
-- SELECT tag_name, COUNT(*) 
-- FROM tags
-- INNER JOIN photo_tags
--     ON tags.id = photo_tags.tag_id
-- GROUP BY tags.id
-- ORDER BY 2 DESC
-- LIMIT 5;

-- FIND USERS WHO HAVE LIKED EVERY SINGLE PHOT ON THE SITE
SELECT 
    username, 
    COUNT(likes.user_id) AS num_of_likes,
    CASE
        WHEN COUNT(likes.user_id) = (SELECT COUNT(*) FROM photos) THEN 'BOT DETECTED'
        WHEN COUNT(likes.user_id) < (SELECT COUNT(*) FROM photos) THEN 'NOT BOT'
    END AS 'BOT'
FROM users
INNER JOIN likes
    ON users.id = likes.user_id
INNER JOIN photos
    ON likes.photo_id = photos.id
GROUP BY username
HAVING num_of_likes = (SELECT COUNT(*) FROM photos);