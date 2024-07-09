SELECT
    T0.DocEntry AS 'SalesOrderID',
    T0.DocNum AS 'SalesOrderNumber',
    T0.CardCode AS 'CustomerCode',
    T0.CardName AS 'CustomerName',
    T0.DocDate AS 'DocumentDate',
    T0.DocTotal AS 'TotalAmount',
    T0.SlpCode AS 'SalesPerson',
    T0.NumAtCard AS 'Reference',
    T0.Comments AS 'Comments',
    T1.DocStatus AS 'ApprovalStatus'
FROM
    ORDR T0
    INNER JOIN ODRF T1 ON T0.DocEntry = T1.DocEntry
WHERE
    T1.ObjType = 17 -- Sales Order object type
    AND T1.DocStatus = 'P'
