#!/bin/bash

#SOURCE="Amazon"
SOURCE="Walmart"

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
