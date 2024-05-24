
DROP DATABASE IF EXISTS app_food;
CREATE DATABASE app_food;
USE app_food;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS restaurant;
DROP TABLE IF EXISTS food;
DROP TABLE IF EXISTS like_res;
DROP TABLE IF EXISTS food_type;
DROP TABLE IF EXISTS sub_food;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS rate_res;



CREATE TABLE users(
	user_id INT PRIMARY KEY AUTO_INCREMENT,
	full_name VARCHAR(150) NOT NULL,
	email VARCHAR(150) NOT NULL,
	password VARCHAR(150) NOT NULL
);

INSERT INTO users (full_name,email,password)
VALUES ('John Doe', 'johndoe@example.com', 'password123'),
('Jane Smith', 'janesmith@example.com', 'password456'),
('Alice Johnson', 'alicejohnson@example.com', 'password789'),
('Bob Brown', 'bobbrown@example.com', 'passwordabc'),
('Charlie Davis', 'charliedavis@example.com', 'passworddef'),
('Diana Evans', 'dianaevans@example.com', 'passwordghi'),
('Eve Foster', 'evefoster@example.com', 'passwordjkl'),
('Frank Green', 'frankgreen@example.com', 'passwordmno'),
('Grace Hall', 'gracehall@example.com', 'passwordpqr'),
('Henry King', 'henryking@example.com', 'passwordstu'),
('Du Mi Wu', 'dmq@example.com', 'passwordstla');

CREATE TABLE restaurant(
	res_id INT PRIMARY KEY AUTO_INCREMENT,
	res_name VARCHAR(150) NOT NULL,
	image VARCHAR(150) NOT NULL,
	description VARCHAR(150) 
);

CREATE TABLE like_res(
	user_id INT NOT NULL,
	res_id INT NOT NULL, 
	date_like DATETIME,
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	FOREIGN KEY (res_id) REFERENCES restaurant(res_id)
);

CREATE TABLE rate_res(
	user_id INT NOT NULL,
	res_id INT NOT NULL, 
	amount INT ,
	date_rate DATETIME,
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	FOREIGN KEY (res_id) REFERENCES restaurant(res_id)
);


INSERT INTO like_res (user_id, res_id, date_like) VALUES 
(1, 1, '2024-05-01 12:00:00'),
(2, 2, '2024-05-02 13:00:00'),
(3, 3, '2024-05-03 14:00:00'),
(4, 4, '2024-05-04 15:00:00'),
(5, 5, '2024-05-05 16:00:00'),
(6, 1, '2024-05-06 17:00:00'),
(7, 2, '2024-05-07 18:00:00'),
(8, 3, '2024-05-08 19:00:00'),
(9, 4, '2024-05-09 20:00:00'),
(10, 5, '2024-05-10 21:00:00'),
(1, 2, '2024-05-01 12:00:00'),
(1, 3, '2024-05-02 13:00:00'),
(2, 5, '2024-05-03 14:00:00'),
(2, 4, '2024-05-04 15:00:00'),
(3, 1, '2024-05-05 16:00:00'),
(3, 5, '2024-05-06 17:00:00'),
(4, 2, '2024-05-07 18:00:00'),
(4, 3, '2024-05-08 19:00:00'),
(4, 1, '2024-05-09 20:00:00'),
(5, 2, '2024-05-10 21:00:00');

INSERT INTO rate_res (user_id, res_id, amount, date_rate) VALUES 
(1, 1, 5, '2024-05-01 12:00:00'),
(2, 2, 4, '2024-05-02 13:00:00'),
(3, 3, 3, '2024-05-03 14:00:00'),
(4, 4, 5, '2024-05-04 15:00:00'),
(5, 5, 4, '2024-05-05 16:00:00'),
(6, 1, 3, '2024-05-06 17:00:00'),
(7, 2, 5, '2024-05-07 18:00:00'),
(8, 3, 4, '2024-05-08 19:00:00'),
(9, 4, 2, '2024-05-09 20:00:00'),
(10, 5, 5, '2024-05-10 21:00:00');

INSERT INTO restaurant (res_name,Image,description)
VALUES ('The Gourmet Kitchen', 'gourmet_kitchen.jpg', 'A fine dining experience with a modern twist.'),
('Pizza Paradise', 'pizza_paradise.jpg', 'Serving the best wood-fired pizzas in town.'),
('Sushi World', 'sushi_world.jpg', 'Fresh sushi and sashimi from master chefs.'),
('Burger Haven', 'burger_haven.jpg', 'Gourmet burgers with locally sourced ingredients.'),
('Taco Fiesta', 'taco_fiesta.jpg', 'Authentic Mexican tacos with a variety of fillings.');

CREATE TABLE food_type(
	type_id INT PRIMARY KEY AUTO_INCREMENT,
	type_name VARCHAR(150) NOT NULL 
); 

CREATE TABLE food(
	food_id INT PRIMARY KEY AUTO_INCREMENT,
	food_name VARCHAR(150) NOT NULL,
	image VARCHAR(150) NOT NULL,
	price FLOAT NOT NULL,
	description VARCHAR(150),
	type_id INT NOT NULL,
	FOREIGN KEY (type_id) REFERENCES food_type(type_id)
);

CREATE TABLE orders(
	user_id INT NOT NULL,
	food_id INT NOT NULL,
	amount INT NOT NULL,
	code VARCHAR(100) NOT NULL,
	arr_sub_id VARCHAR(100),
	FOREIGN KEY (food_id) REFERENCES food(food_id),
	FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO orders (user_id, food_id, amount, code, arr_sub_id) VALUES 
(1, 1, 2, 'ORD001', '1,2'),
(2, 2, 1, 'ORD002', '3'),
(3, 3, 3, 'ORD003', '4'),
(4, 4, 2, 'ORD004', NULL),
(5, 5, 1, 'ORD005', '5'),
(6, 6, 4, 'ORD006', '6,7'),
(7, 7, 2, 'ORD007', '8'),
(8, 8, 1, 'ORD008', '9'),
(9, 9, 3, 'ORD009', NULL),
(10, 10, 2, 'ORD010', '10'),
(1, 5, 2, 'ORD0011', '3,2'),
(2, 2, 2, 'ORD0012', '5,2'),
(2, 5, 1, 'ORD0013', NULL);

INSERT INTO food_type (type_name)
VALUES ('Italian'),
('Chinese'),
('Mexican'),
('Japanese'),
('Indian');

INSERT INTO food (food_name,image,price,description,type_id)
VALUES ('Margherita Pizza', 'margherita_pizza.jpg', 8.99, 'Classic pizza with tomatoes, mozzarella, and basil.', 1),
('Kung Pao Chicken', 'kung_pao_chicken.jpg', 12.50, 'Spicy stir-fry with chicken, peanuts, and vegetables.', 2),
('Tacos al Pastor', 'tacos_al_pastor.jpg', 9.75, 'Marinated pork tacos with pineapple and onions.', 3),
('Sushi Platter', 'sushi_platter.jpg', 24.00, 'Assorted sushi and sashimi.', 4),
('Chicken Tikka Masala', 'chicken_tikka_masala.jpg', 14.25, 'Grilled chicken in a spiced tomato and cream sauce.', 5),
('Coq au Vin', 'coq_au_vin.jpg', 18.50, 'Chicken braised with wine, mushrooms, and onions.', 1),
('Moussaka', 'moussaka.jpg', 13.00, 'Layered eggplant, potatoes, and ground meat.', 2),
('Pad Thai', 'pad_thai.jpg', 11.00, 'Stir-fried rice noodles with shrimp, peanuts, and bean sprouts.', 3),
('Paella', 'paella.jpg', 20.00, 'Rice dish with seafood, chicken, and vegetables.', 4),
('Cheeseburger', 'cheeseburger.jpg', 10.50, 'Burger with cheese, lettuce, tomato, and pickles.', 5);

CREATE TABLE sub_food(
	sub_id INT PRIMARY KEY AUTO_INCREMENT,
	sub_name VARCHAR(150) NOT NULL,
	sub_price FLOAT NOT NULL,
	food_id INT NOT NULL,
	FOREIGN KEY (food_id) REFERENCES food(food_id)
);

INSERT INTO sub_food (sub_name, sub_price, food_id) VALUES 
('Extra Cheese', 1.50, 1),
('Extra Peanuts', 0.75, 2),
('Salsa', 0.50, 3),
('Extra Wasabi', 0.75, 4),
('Garlic Naan', 1.50, 5),
('Bacon', 2.00, 10),
('Mushroom Sauce', 1.25, 6),
('Greek Salad', 3.00, 7),
('Extra Shrimp', 4.00, 8),
('Chorizo', 2.50, 9);


-- 5 người đã liike nhà hàng nhiều nhất

SELECT users.full_name,COUNT(*) AS total_likes FROM users 
INNER JOIN like_res
ON users.user_id = like_res.user_id
INNER JOIN restaurant 
ON like_res.res_id = restaurant.res_id
GROUP BY users.user_id
ORDER BY total_likes DESC LIMIT 5;

-- 2 nhà hàng có lượt like nhiều nhất
SELECT restaurant.res_name,COUNT(*) AS total_likes FROM users 
INNER JOIN like_res
ON users.user_id = like_res.user_id
INNER JOIN restaurant 
ON like_res.res_id = restaurant.res_id
GROUP BY restaurant.res_id
ORDER BY total_likes DESC LIMIT 2;

-- Người đặt hàng nhiều nhất 

SELECT users.user_id,users.full_name,COUNT(*) as total_orders FROM users 
LEFT JOIN orders 
ON users.user_id = orders.user_id
GROUP BY users.user_id 
ORDER BY total_orders DESC LIMIT 1;

-- Người dùng không hoạt động

SELECT * FROM users 
 JOIN orders
ON users.user_id = orders.user_id
INNER JOIN rate_res
ON orders.user_id = rate_res.user_id
INNER JOIN like_res
ON rate_res.user_id = like_res.user_id;
