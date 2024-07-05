SELECT 
    T1.AcctCode AS GLAccountCode,
    T1.AcctName AS GLAccountName,
    SUM(T0.Debit - T0.Credit) AS Balance
FROM 
    JDT1 T0
INNER JOIN 
    OACT T1 ON T0.Account = T1.AcctCode
WHERE 
    T0.RefDate BETWEEN '2024-01-01' AND '2024-12-31'
    AND T1.Finanse = 'Y'  -- Ensure only financial accounts are selected
GROUP BY 
    T1.AcctCode,
    T1.AcctName
ORDER BY 
    T1.AcctCode ASC


