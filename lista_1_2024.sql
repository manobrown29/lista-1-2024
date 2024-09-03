-- EXERCICIOS--
-- Exercício 1: Listar todos os pedidos com detalhes do cliente --
 
SELECT 
    o.order_id,
    o.order_date,
    CONCAT(c.first_name, ' ', c.last_name) AS full_name,
    c.email
FROM 
    Orders o
JOIN 
    Customers c ON o.customer_id = c.customer_id;
    
-- Exercício 2: Encontrar todos os produtos pedidos por um cliente específico --
 
SELECT 
    p.product_name,
    oi.quantity
FROM 
    Order_Items oi
JOIN 
    Orders o ON oi.order_id = o.order_id
JOIN 
    Products p ON oi.product_id = p.product_id
WHERE 
    o.customer_id = 1;
 


-- Exercício 3: Calcular o total gasto por cada cliente --
 
SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS full_name,
    SUM(oi.quantity * p.price) AS total_spent
FROM 
    Customers c
JOIN 
    Orders o ON c.customer_id = o.customer_id
JOIN 
    Order_Items oi ON o.order_id = oi.order_id
JOIN 
    Products p ON oi.product_id = p.product_id
GROUP BY 
    c.customer_id;
    
-- Exercício 4: Encontrar os clientes que nunca fizeram um pedido --
 
SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS full_name
FROM 
    Customers c
LEFT JOIN 
    Orders o ON c.customer_id = o.customer_id
WHERE 
    o.order_id IS NULL;
    

-- Exercício 5: Listar os produtos mais vendidos --
 
SELECT 
    p.product_name,
    SUM(oi.quantity) AS total_sold
FROM 
    Order_Items oi
JOIN 
    Products p ON oi.product_id = p.product_id
GROUP BY 
    p.product_id
ORDER BY 
    total_sold DESC;

