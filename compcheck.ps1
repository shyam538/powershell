cd E:\Siebel\ses\siebsrvr\BIN

$enterprise = 'ESIA17'
$gateway = 'edivsvr039'
$server = 'SSIA17'
$username = 'sadmin'
$password = 'sadmin'
$header = 'Server','Component','Status', 'Mode' 

$scmds = gci scmds.txt

$spool = .\srvrmgr /g $gateway /e $enterprise  /u $username  /p $password /i $scmds|sls $server|ConvertFrom-Csv -Header $header

$spool| ? {$_.Mode.Trim() -like 'Auto' -and $_.Status.Trim() -notin 'Online','Running' }
