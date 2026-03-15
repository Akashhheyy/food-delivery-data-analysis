
CREATE TABLE food_orders (
order_number INT,
order_datetime TIMESTAMP,
order_city TEXT,
restaurant_type TEXT,
total_bill FLOAT,
delivery_duration INT,
customer_rating FLOAT
);	

SELECT * FROM food_orders;

SELECT * FROM food_orders
LIMIT 10;

SELECT * 
FROM food_orders
LIMIT 10;

SELECT COUNT(*) 
FROM food_orders;

SELECT SUM(total_bill) AS total_revenue
FROM food_orders;

SELECT order_city, COUNT(*) AS total_orders
FROM food_orders
GROUP BY order_city
ORDER BY total_orders DESC;

SELECT AVG(delivery_duration) AS avg_delivery_time
FROM food_orders;

SELECT restaurant_type, COUNT(*) AS orders
FROM food_orders
GROUP BY restaurant_type
ORDER BY orders DESC;

SELECT COUNT(*) FROM food_orders;

SELECT COUNT(*) 
FROM food_orders;

SELECT SUM(total_bill) AS total_revenue
FROM food_orders;

SELECT order_city, COUNT(*) AS total_orders
FROM food_orders
GROUP BY order_city
ORDER BY total_orders DESC;

SELECT AVG(delivery_duration) AS avg_delivery_time
FROM food_orders;

CREATE VIEW city_order_summary AS
SELECT 
    f.order_city,
    c.latitude,
    c.longitude,
    COUNT(*) AS total_orders,
    SUM(f.total_bill) AS total_revenue
FROM food_orders f
JOIN cities c
ON f.order_city = c.city
GROUP BY f.order_city, c.latitude, c.longitude;

SELECT * FROM city_order_summary;


SELECT 
    order_city,
    SUM(total_bill) AS total_revenue
FROM food_orders
GROUP BY order_city
ORDER BY total_revenue DESC;

SELECT 
    order_city,
    AVG(delivery_duration) AS avg_delivery_time
FROM food_orders
GROUP BY order_city
ORDER BY avg_delivery_time DESC; 

SELECT 
    order_city,
    AVG(total_bill) AS avg_order_value
FROM food_orders
GROUP BY order_city
ORDER BY avg_order_value DESC;

SELECT 
    f.order_city,
    c.latitude,
    c.longitude,
    COUNT(*) AS total_orders,
    SUM(f.total_bill) AS total_revenue,
    AVG(f.delivery_duration) AS avg_delivery_time,
    AVG(f.customer_rating) AS avg_rating
FROM food_orders f
JOIN cities c
ON f.order_city = c.city
GROUP BY f.order_city, c.latitude, c.longitude
ORDER BY total_orders DESC;