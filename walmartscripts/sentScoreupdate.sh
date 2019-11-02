#!/bin/bash
A_COUNTER=0

cat walmartsenti_1.txt | while read line
do
	read idVar sentimentVar <<< "$line"
	#echo $idVar $sentimentVar
	#mysql --defaults-extra-file=./mysqlconfigs.txt -N -e "SELECT id, sentiment, sentScore FROM db.Data WHERE (source = 'Walmart' AND id = $idVar AND sentiment = $sentimentVar);"
	mysql --defaults-extra-file=./mysqlconfigs.txt -N -e "UPDATE db.Data SET sentScore = 1.0 WHERE (source = 'Walmart' AND id = $idVar AND sentiment = $sentimentVar);"
	#mysql --defaults-extra-file=./mysqlconfigs.txt -N -e "SELECT id, sentiment, sentScore FROM db.Data WHERE (source = 'Walmart' AND id = $idVar AND sentiment = $sentimentVar);"

	#exit

	A_COUNTER=$((A_COUNTER+1))
	echo $A_COUNTER

done

<< --
#mysqlconfigs.txt
[client]
user = whatever
password = whatever
host = whatever
--

