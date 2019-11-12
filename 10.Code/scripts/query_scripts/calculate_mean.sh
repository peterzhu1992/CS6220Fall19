#!/bin/bash

###### Information ######
# Name:          calculate_mean.sh
# Course:        CS 6220
# Semester:      Fall 2019
# Instructor:    Ling Liu
#
# About:         Script to calculate the means among the ratings
#                Using each amount of ratings divided by total amount and multiply the ratings
#                Add the results together to get the mean
#
# Writor:        Jiaxiang Zhu
# Start Date:    2019-10-17
# Modified Date: 2019-11-12
#########################

echo "This mean script utilize the bc utility"
echo "Written fast with hard coding only"
echo "Example Usage: \"$0 743 694 1364 3030 9889\""
#TOTAL=15720
TOTAL=62562

PER_1=`echo $1/$TOTAL*1 | bc -l`
PER_2=`echo $2/$TOTAL*2 | bc -l`
PER_3=`echo $3/$TOTAL*3 | bc -l`
PER_4=`echo $4/$TOTAL*4 | bc -l`
PER_5=`echo $5/$TOTAL*5 | bc -l`

echo $TOTAL
echo $PER_1 $PER_2 $PER_3 $PER_4 $PER_5
echo $PER_1 + $PER_2 + $PER_3 + $PER_4 + $PER_5 | bc


