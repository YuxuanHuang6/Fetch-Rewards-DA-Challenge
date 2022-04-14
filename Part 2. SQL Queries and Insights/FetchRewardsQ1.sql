-- What are the top 5 brands by receipts scanned for most recent month?

SELECT b.name
FROM receipts r 
RIGHT JOIN itemslist i ON r.receiptId = i.receiptId
LEFT JOIN product p ON i.barcode = p.barcode 
LEFT JOIN brand b ON b.barcode = p.barcode
WHERE DATE_FORMAT(FROM_UNIXTIME(r.dateScanned), '%Y%m') = DATE_FORMAT(CURDATE(), '%Y%m') 
GROUP BY b.brandId 
ORDER BY COUNT(*) DESC
LIMIT 5