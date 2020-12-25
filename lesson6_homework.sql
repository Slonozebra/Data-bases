USE vk;
-- 2. Пусть задан некоторый пользователь. 
-- Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем. 
--  Не смогла решить данную задачу( 


-- 3. Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.
SELECT COUNT(*) FROM LIKES WHERE users_id IN (
  SELECT * FROM (
    SELECT users_id FROM profiles ORDER BY birthday DESC LIMIT 10
    ) as smth
);

-- 4. Определить кто больше поставил лайков (всего) - мужчины или женщины?
SELECT gender FROM (
	SELECT gender, COUNT((SELECT COUNT(*) FROM likes as L where L.users_id = P.users_id)) as gender_likes_count FROM profiles as P
	WHERE gender = 'm'
	GROUP BY gender
	UNION ALL
	SELECT gender, COUNT((SELECT COUNT(*) FROM likes as L where L.users_id = P.users_id)) FROM profiles as P
	WHERE gender = 'f'
	GROUP BY gender
) AS T
GROUP BY gender
ORDER BY MAX(gender_likes_count) DESC
LIMIT 1;

-- 5. Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.
SELECT id, SUM(acts) as acts FROM 
 (SELECT id, 0 as acts FROM users
	UNION
	SELECT users_id as id, count(*) as acts FROM media
	GROUP BY users_id
	UNION
	SELECT users_id, COUNT(*) FROM likes
	GROUP BY users_id
	UNION
	SELECT from_users_id, COUNT(*) FROM messages
	GROUP BY from_users_id) AS activities
GROUP BY id
ORDER BY acts
LIMIT 10
;