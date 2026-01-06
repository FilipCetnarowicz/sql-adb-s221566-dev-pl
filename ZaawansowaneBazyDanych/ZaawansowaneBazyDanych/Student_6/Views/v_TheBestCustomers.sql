-- ulubionych wybieram oczywiście na podstawie tego jaki obrót generują dla firmy
CREATE VIEW Student_6.v_TheBestCustomers AS 
SELECT c.CustomerID, c.FirstName, c.LastName, SUM(soh.TotalDue) as TotalSpent
FROM [221566].Customer as c JOIN SalesLT.SalesOrderHeader as soh
ON c.CustomerID = soh.CustomerID
group by c.CustomerID, c.FirstName, c.LastName
HAVING SUM(soh.TotalDue) > 5000;
