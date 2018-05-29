SELECT p.name AS product_name
    , c.name AS category_name
FROM Products p
LEFT JOIN ProductCategory pc 
    ON p.id = pc.product_id
LEFT JOIN Categories c
    ON pc.category_id = c.id
GO
