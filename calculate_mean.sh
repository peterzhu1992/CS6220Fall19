#!/bin/bash
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

#Written by JiaxiangZhu

