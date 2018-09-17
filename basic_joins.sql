SELECT 
    users.id AS user_id, 
    username, 
    image_url, 
    photos.created_at 
FROM users 
INNER JOIN photos 
    ON users.id = photos.user_id;