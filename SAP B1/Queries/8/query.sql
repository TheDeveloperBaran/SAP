SELECT CardCode, CardName, SUM(Balance) AS TotalBalance
FROM OCRD
WHERE CardType = 'S'
GROUP BY CardCode, CardName
ORDER BY TotalBalance DESC
