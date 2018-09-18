-- SELECT 
--     users.id AS user_id, 
--     username, 
--     image_url, 
--     photos.created_at 
-- FROM users 
-- INNER JOIN photos 
--     ON users.id = photos.user_id;
    
SELECT 
    users.id AS user_id, 
    username, 
    image_url, 
    photos.created_at, 
    comment_text
FROM users 
INNER JOIN photos 
    ON users.id = photos.user_id
INNER JOIN comments
    ON photos.user_id = comments.user_id
GROUP BY user_id;