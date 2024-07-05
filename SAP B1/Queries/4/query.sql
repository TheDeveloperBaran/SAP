SELECT 
    OINV.DocNum AS InvoiceNumber,
    OINV.DocDate AS InvoiceDate,
    INV1.ItemCode,
    OITM.ItemName,
    INV1.LineTotal AS SalesAmount,
    INV1.GrossProfit AS GrossProfitAmount,
    (INV1.GrossProfit / NULLIF(INV1.LineTotal, 0)) * 100 AS GrossProfitMargin
FROM 
    OINV
INNER JOIN 
    INV1 ON OINV.DocEntry = INV1.DocEntry
INNER JOIN 
    OITM ON INV1.ItemCode = OITM.ItemCode
WHERE 
    OINV.DocDate >= '2023-01-01'
ORDER BY 
    OINV.DocDate ASC
