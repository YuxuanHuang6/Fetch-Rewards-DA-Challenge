-- Which brand has the most transactions among users who were created within the past 6 months

SELECT b.name
FROM receipts r 
LEFT JOIN users u ON r.usersId = u.usersId
RIGHT JOIN itemslist i ON r.receiptId = i.receiptId
LEFT JOIN product p ON i.barcode = p.barcode 
LEFT JOIN brand b ON b.barcode = p.barcode
WHERE PERIOD_DIFF(DATE_FORMAT(CURDATE(), '%Y%m'), DATE_FORMAT(FROM_UNIXTIME(u.createdDate), '%Y%m')) <= 6
GROUP BY b.brandId 
ORDER BY COUNT(b.brandId) DESC
LIMIT 1