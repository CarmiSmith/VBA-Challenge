Attribute VB_Name = "Module1"
Sub Stock_market()
For Each ws In Worksheets

Dim Ticker As String

Dim FirstOpenPrice As Double
FirstOpenPrice = 0

Dim LastClosePrice As Double
LastClosePrice = 0

Dim StockVolume As Long
StockVolume = 0

Dim YearlyChange As Double
YearlyChange = 0

Dim PercentageChange As Double
Percentage = 0

Dim TotalStockVolume As Double
TotalStockVolume = 0

Dim TickerRow As Integer



    FirstOpenPrice = ws.Cells(2, 3).Value
   
    LastRow = ws.Cells(Rows.Count, 1).End(xlUp).Row
     
    TickerRow = 2

'Headers for output table
ws.Cells(1, 9).Value = "Ticker"
ws.Cells(1, 10).Value = "Yearly Change"
ws.Cells(1, 11).Value = "Percenatge Change"
ws.Cells(1, 12).Value = "Total Stock Volume"

For i = 2 To LastRow


If ws.Cells(i + 1, 1).Value <> ws.Cells(i, 1).Value Then
    
    Ticker = ws.Cells(i, 1).Value
    LastClosePrice = ws.Cells(i, 6).Value
    'StockVolume = ws.Cells(i, 7).Value
    
    YearlyChange = LastClosePrice - FirstOpenPrice
    
        If FirstOpenPrice > 0 Then
             PercentageChange = YearlyChange / FirstOpenPrice
        Else
            PercenatgeChange = 0
        End If
   
        
        If (YearlyChange > 0) Then
            ws.Range("J" & TickerRow).Interior.ColorIndex = 4
        Else
            ws.Range("J" & TickerRow).Interior.ColorIndex = 3
        End If
    
    TotalStockVolume = TotalStockVolume + ws.Cells(i, 7).Value
    
    
    ws.Range("I" & TickerRow).Value = Ticker
    ws.Range("J" & TickerRow).Value = YearlyChange
    ws.Range("K" & TickerRow).Value = PercentageChange
    ws.Range("L" & TickerRow).Value = TotalStockVolume
    ws.Range("K" & TickerRow).NumberFormat = "00.00%"
    FirstOpenPrice = ws.Cells(i + 1, 3).Value
    
    
    TickerRow = TickerRow + 1
    
    
    TotalStockVolume = 0
    
    Else
    YearlyChange = LastClosePrice - FirstOpenPrice
    TotalStockVolume = TotalStockVolume + ws.Cells(i, 7).Value
    
    End If
    
        
            
   
Next i

Next ws

End Sub
