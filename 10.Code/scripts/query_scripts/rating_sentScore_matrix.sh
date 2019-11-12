#!/bin/bash

###### Information ######
# Name:          rating_sentScore_matrix.sh
# Course:        CS 6220
# Semester:      Fall 2019
# Instructor:    Ling Liu
#
# About:         Script to calculate the matrix / figure of rating and sentimentScore
#                Need manually change values and comments for Amazon and Walmart
#                The same for total and each category
#
# Writor:        Jiaxiang Zhu
# Start Date:    2019-10-24
# Modified Date: 2019-11-12
#########################

echo "Written fast with hard coding only"
echo "Example Usage (Total Amount): \"$0\""
echo "Example Usage (Specific Category): \"$0 Electronics\""

SOURCE="Amazon"
#SOURCE="Walmart"

for i in `seq 1.0 5.0`;
do

	for j in `seq 1.0 5.0`
	do

		#echo "ij: $i $j"

		#VALUES=`mysql --defaults-extra-file=mysqlconfigs.txt -N -e "SELECT COUNT(*) FROM db.Data WHERE (source = '$SOURCE' AND score = $j AND sentScore = $i);"`
		VALUES=`mysql --defaults-extra-file=mysqlconfigs.txt -N -e "SELECT COUNT(*) FROM db.Data WHERE (source = '$SOURCE' AND department = '$1' AND score = $j AND sentScore = $i);"`
		echo -ne "$VALUES \t"
	done

	echo ""

done

echo ""

# Written by JiaxiangZhu

