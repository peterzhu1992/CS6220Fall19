#!/bin/bash

###### Attributes ######

IS_KORE_5=true
CATEGORY_NAME="$1"
PRODUCT_ASIN=""
CURR_DIR=`pwd`
COMBINED_DATA_CAT_DIR="$CURR_DIR/combined_data/$CATEGORY_NAME"


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
	INPUT_FEEDBACKS_FILE="$CURR_DIR/feedbacks_data/feedbacks_$CATEGORY_NAME_5.json"
else
	INPUT_FEEDBACKS_FILE="$CURR_DIR/feedbacks_data/feedbacks_$CATEGORY_NAME.json"
fi


echo "Initial settings: CATEGORY_NAME=$CATEGORY_NAME, IS_KORE_5=$IS_KORE_5"

###########################


###### Main Steps ###### 

mkdir -p $COMBINED_DATA_CAT_DIR
#grep -e "'asin': 'B00000JBLH'" meta_data/Office_Products/meta_Office_Products.json

########################
