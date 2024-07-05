Select A.DocNum[SO No], A.DocEntry [SO DocEntry], A.DocDate [SO DocDate], H.ItmsGrpNam, G.FrgnName, G.ItemCode, G.ItemName

  , D.DocDate [DC Date], D.DocNum [DC No], F.DocDate [Invoice Date], F.DocNum [Invoice No]

From ORDR A

  Inner Join RDR1 B on A.docEntry = B.DocEntry

  left Outer Join DLN1 C on C.BaseType = 17 and C.BaseEntry = B.DocEntry and C.BaseLine = B.LineNum

  left Outer Join ODLN D on C.docEntry = D.DocEntry and D.Canceled = 'N'

  left Outer Join INV1 E on E.BaseType = 15 and E.BaseEntry = C.DocEntry and E.BaseLine = C.LineNum

  left Outer Join OINV F on E.docEntry = F.DocEntry  and F.Canceled = 'N'

  Inner Join OITM G on B.ItemCode = G.ItemCode

  Inner Join OITB H on G.ItmsGrpCod = H.ItmsGrpCod

Where A.DocDate >=[%0]

  and A.DocDate <=[%1]
