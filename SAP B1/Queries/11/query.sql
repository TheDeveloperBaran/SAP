SELECT
    T0.DocNum AS 'Purchase Order Number',
    T0.DocDate AS 'Document Date',
    T0.CardCode AS 'Vendor Code',
    T0.CardName AS 'Vendor Name',
    T0.DocTotal AS 'Document Total',
    T0.DocTotalFC AS 'Document Total (FC)',
    T0.DocTotalSy AS 'Document Total (Sys)',
    T1.LineNum AS 'Line Number',
    T1.ItemCode AS 'Item Code',
    T1.Dscription AS 'Item Description',
    T1.Quantity AS 'Quantity',
    T1.Price AS 'Price',
    T1.LineTotal AS 'Line Total',
    T1.Currency AS 'Currency',
    T1.VatGroup AS 'VAT Group',
    T2.VatPrcnt AS 'VAT Percentage',
    T2.PriceBefDi AS 'Price Before Discount',
    T2.LineTotal AS 'Line Total Before Discount'
FROM 
    OPOR T0
INNER JOIN 
    POR1 T1 ON T0.DocEntry = T1.DocEntry
LEFT JOIN 
    PQT1 T2 ON T1.DocEntry = T2.BaseEntry AND T1.LineNum = T2.BaseLine
WHERE 
    T0.DocStatus = 'O'
ORDER BY 
    T0.DocNum, T1.LineNum
