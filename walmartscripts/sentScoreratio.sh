#!/bin/bash
A_COUNTER=0
#SOURCE="Amazon"
SOURCE="Walmart"


for i in `seq 1.0 5.0`
do
	
	#mysql --defaults-extra-file=./mysqlconfigs.txt -N -e "SELECT (SELECT COUNT(*) FROM db.Data WHERE (sentScore = $i AND source = '$SOURCE')) / (SELECT COUNT(*) FROM db.Data WHERE source = '$SOURCE');" > test1.txt && cat test1.txt
	#mysql --defaults-extra-file=./mysqlconfigs.txt -N -e "SELECT (SELECT COUNT(*) FROM db.Data WHERE (sentScore = $i AND source = '$SOURCE' AND department = '$1')) / (SELECT COUNT(*) FROM db.Data WHERE source = '$SOURCE' AND department = '$1');" > test1.txt && cat test1.txt

	#mysql --defaults-extra-file=./mysqlconfigs.txt -N -e "SELECT COUNT(*) FROM db.Data WHERE (sentScore = $i AND source = '$SOURCE');" > test1.txt && cat test1.txt
	mysql --defaults-extra-file=./mysqlconfigs.txt -N -e "SELECT COUNT(*) FROM db.Data WHERE (sentScore = $i AND source = '$SOURCE' AND department = '$1');" > test1.txt && cat test1.txt

done

rm test1.txt

<< --
#mysqlconfigs.txt
[client]
user = whatever
password = whatever
host = whatever
--

