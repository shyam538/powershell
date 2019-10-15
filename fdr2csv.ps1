
$SPATH='E:\shyam'

cd E:\sba81\siebsrvr\BIN
$fdrfiles=gci *.fdr| ? {($_.LastWriteTime.Year -eq 2019) -and ($_.LastWriteTime.Month -ge 05)}


foreach ($fdr in $fdrfiles){
$csv="$($SPATH)\fdrcsv\$($fdr.BaseName).csv"
.\sarmanalyzer.exe -x -o $csv -f $fdr


}