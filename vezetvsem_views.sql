USE vezetvsem;
CREATE VIEW info_orders 
AS SELECT price,date_of_registration,date_of_end, status, name,description
FROM orders, application_for_order
WHERE orders.application_for_order_id = application_for_order.id;
SELECT * FROM info_orders;


CREATE VIEW info_customers
AS SELECT username, firstname, lastname, email, phone, adress
FROM users, customers
WHERE users.id = customers.users_id ;
SELECT * FROM info_customers;