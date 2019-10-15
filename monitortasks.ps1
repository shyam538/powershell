#Base script to log components for load analysis
cd E:\SBA81\siebsrvr\BIN

$scmds = gci scmds.txt
$outfile ='monitortasks.csv'


#$header = 'DateTime','Server','Component','Status', 'RunningTasks', 'MaxTasks'
filter timestamp {"$(get-date -UFormat '%Y-%m-%d %R'), $_"}

$spool = .\srvrmgr_1 /g rcovsvr3096 /e IRISPRD3 /u sadmin /p xxxxx /i $scmds|sls RCO
#$spool|timestamp|ConvertFrom-Csv -Header $header| ft
$spool|timestamp|Add-Content $outfile 
