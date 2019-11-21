#!/bin/bash

###### Information ######
# Name:          sentScore_updatedb.sh
# Course:        CS 6220
# Semester:      Fall 2019
# Instructor:    Ling Liu
#
# About:         Script to calculate the sentimentScore based on the sentiment value
#                and update back to the mysql db
#                We use the following conversion to convert value to score for 1 2 3 4 5:
#                -1.0 ~ -0.6     -0.6 ~ -0.2        -0.2 ~ 0.2         0.2 ~ 0.6     0.6 ~ 1.0
#                Need manually change values and comments for Amazon and Walmart
#                The same for total and each category
#
# Writor:        Jiaxiang Zhu
# Start Date:    2019-10-24
# Modified Date: 2019-11-12
#########################

echo "Written fast with hard coding only"
echo "Example Usage (manually change the input data file name then run): \"$0\""

A_COUNTER=0

cat walmartsenti_1.txt | while read line
do
	read idVar sentimentVar <<< "$line"
	#echo $idVar $sentimentVar
	#mysql --defaults-extra-file=./mysqlconfigs.txt -N -e "SELECT id, sentiment, sentScore FROM db.Data WHERE (source = 'Walmart' AND id = $idVar AND sentiment = $sentimentVar);"
	mysql --defaults-extra-file=./mysqlconfigs.txt -N -e "UPDATE db.Data SET sentScore = 5.0 WHERE (source = 'Walmart' AND id = $idVar AND sentiment = $sentimentVar);"
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

# Written by JiaxiangZhu

