-- Order details for orders with cost greater than 150
SELECT
    c.CustomerID,
    c.FullName,
    o.OrderID,
    o.TotalCost AS Cost,
    m.Name AS MenuName,
    mi.Course AS CourseName,
    mi.Starter AS StarterName
FROM Customers c 
JOIN Orders o USING (CustomerID)
JOIN Menus m USING (MenuID)
JOIN MenuItem mi USING (MenuItemID)
WHERE o.TotalCost > 150
ORDER BY o.TotalCost;
