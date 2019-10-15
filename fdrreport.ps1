### FOR ANALYSING ALREADY CONVERTED FILES ####
### Display last 20 lines of CRASHING Thread
### Run this script where csv are located

$outfile='fdrdash.html'

Remove-Item $outfile

Add-Content $outfile @"
<html><head>
<style>
DIV {text-align: center}
TABLE {table-layout: auto; width:80%; margin: 0 10%; border: 1px solid black; border-collapse: collapse;}
TH {border: 1px solid black; padding: 3px; background-color: #6495ED;}
TD {border: 1px solid black; padding: 3px; }
</style>
</head>
<body>
"@

foreach ($file in gci *.csv){

$data=import-csv $file

Add-Content $outfile "<div><h2>$file </h2>"

$th=$data|where {$_.SubAreaSymbol -eq 'FdrSub_FDR_CRASH'}|select -exp ThreadID
$data|where {$_.ThreadID -eq $th}|sort {[int]$_.FdrID }|select UTC,ThreadID,SubAreaDesc,UserStr1,UserStr2|select -last 20|ConvertTo-Html -Fragment|Add-Content $outfile

Add-Content $outfile "</div>"

}


Add-Content $outfile @"
</body>
</html>
"@

Invoke-Item $outfile