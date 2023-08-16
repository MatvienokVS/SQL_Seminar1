CREATE FUNCTION DeleteUser(@userId INT)
RETURNS INT
AS
BEGIN
    -- Удаление сообщений
    DELETE FROM messages WHERE sender_id = @userId OR receiver_id = @userId;
    
    -- Удаление лайков
    DELETE FROM likes WHERE user_id = @userId;
    
    -- Удаление медиа записей (предположим, это в другой таблице)
    DELETE FROM media WHERE user_id = @userId;
    
    -- Удаление профиля
    DELETE FROM profiles WHERE user_id = @userId;
    
    -- Удаление записи из таблицы users
    DELETE FROM users WHERE id = @userId;
    
    RETURN @userId;
END;
