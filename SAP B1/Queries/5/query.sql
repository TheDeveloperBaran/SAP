SELECT 
    T0.RefDate AS PostingDate,
    T0.TransId AS TransactionID,
    T0.Debit AS DebitAmount,
    T0.Credit AS CreditAmount,
    T0.DueDate AS DueDate,
    OCRD.CardCode AS BusinessPartnerCode,
    OCRD.CardName AS BusinessPartnerName
FROM 
    JDT1 T0
INNER JOIN 
    OCRD ON T0.ShortName = OCRD.CardCode
WHERE 
    T0.TransType = 24
ORDER BY 
    T0.RefDate DESC
