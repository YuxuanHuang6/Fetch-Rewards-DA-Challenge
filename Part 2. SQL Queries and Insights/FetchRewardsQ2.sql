-- ￼How does the ranking of the top 5 brands by receipts scanned for the recent month compare to the ranking for the previous month?

CREATE VIEW top5_bands_recent_month AS
SELECT b.name
FROM receipts r 
RIGHT JOIN itemslist i ON r.receiptId = i.receiptId
LEFT JOIN product p ON i.barcode = p.barcode 
LEFT JOIN brand b ON b.barcode = p.barcode
WHERE DATE_FORMAT(FROM_UNIXTIME(r.dateScanned), '%Y%m') = DATE_FORMAT(CURDATE(), '%Y%m')
GROUP BY b.brandId 
ORDER BY COUNT(*) DESC
LIMIT 5;

CREATE VIEW brands_ranking AS
SELECT b.name, DATE_FORMAT(FROM_UNIXTIME(p.dateScanned)) AS yearMonth, RANK() OVER (PARTITION BY DATE_FORMAT(FROM_UNIXTIME(p.dateScanned)) ORDER BY COUNT(*) DESC) AS the_rank
FROM receipts r 
RIGHT JOIN itemslist i ON r.receiptId = i.receiptId
LEFT JOIN product p ON i.barcode = p.barcode 
LEFT JOIN brand b ON b.barcode = p.barcode
GROUP BY b.brandId, DATE_FORMAT(FROM_UNIXTIME(r.dateScanned))
ORDER BY yearMonth DESC, the_rank;

SELECT name, yearMonth, the_rank FROM brands_ranking
WHERE name in (SELECT * FROM top5_bands_recent_month)
