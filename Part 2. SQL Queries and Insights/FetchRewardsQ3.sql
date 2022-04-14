-- ￼When considering average spend from receipts with 'rewardsReceiptStatus’ of ‘Accepted’ or ‘Rejected’, which is greater?

SELECT rewardsReceiptStatus, AVG(totalSpent) as averageSpent
FROM receipts
WHERE rewardsReceiptStatus = 'FINISHED' OR rewardsReceiptStatus = 'REJECTED'
GROUP BY rewardsReceiptStatus
ORDER BY averageSpent DESC