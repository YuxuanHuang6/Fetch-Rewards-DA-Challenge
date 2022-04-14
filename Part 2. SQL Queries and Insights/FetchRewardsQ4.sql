-- ￼When considering total number of items purchased from receipts with 'rewardsReceiptStatus’ of ‘Accepted’ or ‘Rejected’, which is greater?

SELECT rewardsReceiptStatus, SUM(purchasedItemCount) as totalItems
FROM receipts r 
WHERE rewardsReceiptStatus = 'FINISHED' or rewardsReceiptStatus = 'REJECTED'
GROUP BY rewardsReceiptStatus
ORDER BY totalItems DESC