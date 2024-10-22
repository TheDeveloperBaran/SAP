DECLARE @Date1 DATETIME
DECLARE @Date2 DATETIME
 
SET @Date1 = (SELECT MIN(S0.[DocDate]) FROM OINM S0 WHERE S0.[DocDate] >= '[%0]');
SET @Date2 = (SELECT MAX(S1.[DocDate]) FROM OINM S1 WHERE S1.[DocDate] <= '[%1]');

WITH ConsumptionData AS
(		
SELECT 
	 D0.[ItemCode]
	,D0.[DocDate] AS 'Date'
	,D0.[Quantity] AS 'Sold'
	,0 AS 'Issued'
	,D0.[Quantity] AS 'Combined'
FROM
	INV1 D0 WITH (NOLOCK)
	INNER JOIN OINV D1 WITH (NOLOCK) ON D0.[DocEntry] = D1.[DocEntry]
WHERE D1.[CANCELED] = 'N'

UNION ALL

SELECT 
	 D0.[ItemCode]
	,D0.[DocDate] AS 'Date'
	,D0.[Quantity] * -1 AS 'Sold'
	,0 AS 'Issued'
	,D0.[Quantity] * -1 AS 'Combined'
FROM
	RIN1 D0 WITH (NOLOCK)
	INNER JOIN ORIN D1 WITH (NOLOCK) ON D0.[DocEntry] = D1.[DocEntry]
WHERE D1.[CANCELED] = 'N'

UNION ALL

SELECT
	 D0.[ItemCode]
	,D1.[PostDate] AS 'Date'
	,0 AS 'Sold'
	,D0.[IssuedQty] AS 'Issued'
	,D0.[IssuedQty] AS 'Combined'
FROM
	WOR1 D0 WITH (NOLOCK)
	INNER JOIN OWOR D1 WITH (NOLOCK) ON D0.[DocEntry] = D1.[DocEntry] 
WHERE D1.[Status] IN ('R', 'L')
)


SELECT
	 T0.[ItemCode]
	,T0.[ItemName]
	,ISNULL(SUM(X.[Issued]),0) AS 'Consumed In Production'
	,ISNULL(SUM(X.[Sold]),0) AS 'Sold Quantity'
	,ISNULL(SUM(X.[Combined]),0) AS 'Total Consumption'

FROM
	OITM T0 WITH (NOLOCK)
	LEFT JOIN ConsumptionData X ON T0.[ItemCode] = X.[ItemCode]

WHERE X.[Date] BETWEEN @Date1 AND @Date2

GROUP BY T0.[ItemCode], T0.[ItemName]

ORDER BY T0.[ItemCode]
