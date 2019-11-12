#!/bin/bash

###### Information ######
# Name:          rating_ratio_amount.sh
# Course:        CS 6220
# Semester:      Fall 2019
# Instructor:    Ling Liu
#
# About:         Script to calculate the ratio and amount of ratings with queries
#                Need manually change values and comments for Amazon and Walmart
#                The same for total and each category
#
# Writor:        Jiaxiang Zhu
# Start Date:    2019-10-17
# Modified Date: 2019-11-12
#########################

echo "Written fast with hard coding only"
echo "Example Usage (Total Amount): \"$0\""
echo "Example Usage (Specific Category): \"$0 Electronics\""

A_COUNTER=0
SOURCE="Amazon"
#SOURCE="Walmart"


for i in `seq 1.0 5.0`
do
	
	#mysql --defaults-extra-file=./mysqlconfigs.txt -N -e "SELECT (SELECT COUNT(*) FROM db.Data WHERE (score = $i AND source = '$SOURCE')) / (SELECT COUNT(*) FROM db.Data WHERE source = '$SOURCE');" > test1.txt && cat test1.txt
	#mysql --defaults-extra-file=./mysqlconfigs.txt -N -e "SELECT (SELECT COUNT(*) FROM db.Data WHERE (score = $i AND source = '$SOURCE' AND department = '$1')) / (SELECT COUNT(*) FROM db.Data WHERE source = '$SOURCE' AND department = '$1');" > test1.txt && cat test1.txt

	mysql --defaults-extra-file=./mysqlconfigs.txt -N -e "SELECT COUNT(*) FROM db.Data WHERE (score = $i AND source = '$SOURCE');" > test1.txt && cat test1.txt
	#mysql --defaults-extra-file=./mysqlconfigs.txt -N -e "SELECT COUNT(*) FROM db.Data WHERE (score = $i AND source = '$SOURCE' AND department = '$1');" > test1.txt && cat test1.txt

done

rm test1.txt

<< --
#mysqlconfigs.txt
[client]
user = whatever
password = whatever
host = whatever
--


