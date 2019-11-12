#!/bin/bash

###### Information ######
# Name:          samples_data_script.sh
# Course:        CS 6220
# Semester:      Fall 2019
# Instructor:    Ling Liu
#
# About:         Script to process product feedbacks and metadata
#                Specifically to sort out the initial raw Amazon data from UCSD
#                http://jmcauley.ucsd.edu/data/amazon/
#
# Writor:        Jiaxiang Zhu
# Start Date:    2019-10-04
# Modified Date: 2019-11-12
#########################

###### Attributes ######

IS_KORE_5=true
CLEAN_UP=true
CATEGORY_NAME="$1"
PRODUCT_COUNTER=0
TEMP_COUNTER=0
HEAD_LINES=1000
CURR_DIR=`pwd`
COMBINED_DATA_CAT_DIR="$CURR_DIR/combined_data/$CATEGORY_NAME"
PRODUCT_ASIN_TEMP=""

########################


###### Initial Setup ######

INPUT_METADATA_FILE="$CURR_DIR/meta_data/meta_$CATEGORY_NAME.json"

if [[ $CATEGORY_NAME == "" ]] && [[ -z $CATEGORY_NAME ]]
then
	echo ""
	echo "Please enter the correct category name"
        echo "Example: \"$0 Office_Products\""
	exit 1

fi


if [[ $IS_KORE_5 == true ]]
then
	INPUT_FEEDBACKS_FILE="$CURR_DIR/feedbacks_data/feedbacks_${CATEGORY_NAME}_5.json"
else
	INPUT_FEEDBACKS_FILE="$CURR_DIR/feedbacks_data/feedbacks_${CATEGORY_NAME}.json"
fi


echo "Initial settings: CATEGORY_NAME=$CATEGORY_NAME, IS_KORE_5=$IS_KORE_5"

###########################


###### Main Steps ###### 
echo "Using jq for json parsing purposes, please remember to install it on your server"

mkdir -p $COMBINED_DATA_CAT_DIR
if [[ $CLEAN_UP == true ]]
then
	rm -rf $COMBINED_DATA_CAT_DIR/*
fi

# temporary
HEAD_LINES=`wc -l $INPUT_FEEDBACKS_FILE`
#echo "HEAD_LINES $HEAD_LINES"
#echo "starts in 10 seconds..."
#sleep 10

head -n $HEAD_LINES $INPUT_FEEDBACKS_FILE | while read line
do
	
	PRODUCT_ASIN=`echo "$line" | jq -r .asin`
	
	if [[ $PRODUCT_ASIN != $PRODUCT_ASIN_TEMP ]]
	then
		PRODUCT_COUNTER=$((PRODUCT_COUNTER+1))
		PRODUCT_ASIN_TEMP=$PRODUCT_ASIN
		if [[ $PRODUCT_COUNTER = 101 ]]
		then
			PRODUCT_COUNTER=$((PRODUCT_COUNTER-1))
			echo "$PRODUCT_COUNTER products have been separated into standalone files in $COMBINED_DATA_CAT_DIR"
			break
		else
			echo "product $PRODUCT_COUNTER"
		fi
	fi


	TEMP_COUNTER=$((TEMP_COUNTER+1))
	echo "parsing feedback $TEMP_COUNTER"
	#echo $line | sed 's/\\"//g'
	#echo $COMBINED_DATA_CAT_DIR/feedbacks_$PRODUCT_ASIN.json
	echo $line >> $COMBINED_DATA_CAT_DIR/feedbacks_$PRODUCT_ASIN.json
	#echo ""
done


########################
