USE vezetvsem;
SELECT * FROM users ORDER BY lastname;

SELECT * FROM users WHERE id IN (7, 2);

 SELECT application_for_order_id, COUNT(application_for_order_id) FROM orders
     GROUP BY application_for_order_id;

 SELECT id, COUNT(id) FROM messages
     GROUP BY id;

 SELECT application_for_order_id, MIN(price) as min FROM orders GROUP BY price;

SELECT status, MIN(price) as min FROM orders GROUP BY status;


 SELECT * FROM orders
 JOIN application_for_order ON id=application_for_order_id;

 SELECT * FROM orders
 LEFT JOIN application_for_order ON application_for_order.id =id;

 SELECT load_capacity,name
 FROM cars_types LEFT JOIN service_providers_urlico
 ON service_providers_urlico.users_id=cars_types.id;

 SELECT load_capacity
 FROM cars_types LEFT JOIN service_providers_urlico
 ON service_providers_urlico.users_id=cars_types.id
 WHERE service_providers_urlico.users_id IS NULL;

SELECT name FROM cars_types
UNION ALL
SELECT name_of_organisation FROM service_providers_urlico
ORDER BY name DESC;

SELECT name_of_organisation
FROM service_providers_urlico
WHERE users_id IN (SELECT application_for_order_id
				FROM orders
				WHERE status = 'completed'); 


