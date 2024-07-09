SELECT 
    T0.DocNum as 'Invoice Number',
    T0.DocDate as 'Document Date',
    T0.CardCode as 'Card Code',
    T0.CardName as 'Card Name',
    T0.DocTotal as 'Document Total',
    T0.DocStatus as 'Document Status'
FROM 
    OINV T0
WHERE 
    T0.DocStatus = 'C'
