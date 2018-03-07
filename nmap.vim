$nmap scanme.nmap.org       // port scanning
$nmap -sV scanme.nmap.org   // service version
$nmap scanme.nmap.org -oA logbase   // logging scans
$ls -ltr | grep logbase
$cat logbase.gnmap | grep open
$cat logbase.gnmap | grep '443/open'
$nmap --reason -sV scanme.nmap.org
$nmap -Pn -n dshaw.net    // Running a ping agnostic scan
$nmap 74.125.224.32-41 -sL
$sudo nmap -sU tick.ucla.edu -p123
$sudo nmap -sF -n dshaw.net -p80 --reason
