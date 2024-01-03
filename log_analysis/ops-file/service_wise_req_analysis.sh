#!/bin/bash
dt=`date --date="-1 day" +%d%b%y`;
svcs=("product-info" "customer-info")
path1=/home/bs960/imranMadbar/myPROJECT/log-analysis-automation/log_analysis
path=$path1/processing_data

cd $path1/log-row-data
echo "MicroService,Count"  > $path/ms_hit_count_$dt.csv
i=`ls -ltr|grep log|tail -1|awk '{print $9}'` 
for list in "${svcs[@]}";
	do
		a=`cat $i|awk '{print $6}'|grep $list|wc -l`
		echo $list,$a >> $path/ms_hit_count_$dt.csv;
	done


