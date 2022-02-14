SELECT * FROM CUSTOMERS;
SELECT * FROM ORDER_ITEMS;

--CREATE VIEW 
SELECT * from 
(   
    SELECT name ,credit_limit
    FROM customers
);

CREATE OR REPLACE VIEW customer_sales AS 
SELECT
    NAME AS customer,
    SUM( quantity * unit_price ) sales_amount,
    EXTRACT(
        YEAR
    FROM
        order_date
    ) YEAR
FROM
    ORDERS
INNER JOIN order_items
        USING(order_id)
INNER JOIN customers
        USING(customer_id)
WHERE
    status = 'Shipped'
GROUP BY
    name,
    EXTRACT(
        YEAR
    FROM
        order_date
    );
    
--WE CAN NOW EASILY RETRIVE THE SALE BY THE CUSTOMER 
Select * from CUSTOMER_SALES;
SELECT customer ,
 sales_amount 
FROM
customer_sales
WHERE 
year =2017
ORDER BY 
sales_amount DESC;


SELECT * FROM ORDER_ITEMS;