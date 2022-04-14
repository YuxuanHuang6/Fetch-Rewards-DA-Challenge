-- ￼Which brand has the most spend among users who were created within the past 6 months?

SELECT b.name
FROM receipts r 
LEFT JOIN users u on r.usersId = u.usersId
RIGHT JOIN itemslist i on r.receiptId = i.receiptId
LEFT JOIN product p on i.barcode = p.barcode 
LEFT JOIN brand b on b.barcode = p.barcode
WHERE PERIOD_DIFF(DATE_FORMAT(CURDATE(), '%Y%m'), DATE_FORMAT(FROM_UNIXTIME(u.createdDate), '%Y%m')) <= 6
GROUP BY b.brandId 
ORDER BY SUM(r.totalSpent) DESC
LIMIT 1