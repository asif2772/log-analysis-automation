#!/bin/bash
date
dt=`date --date="-1 day" +%d%b%y`;
svcs=("product-info" "customer-info")
path1=/home/bs960/imranMadbar/myPROJECT/log-analysis-automation/log_analysis
path=$path1/processing_data

cd $path1/log-row-data
echo "MicroService,Count"  > $path/ms_hit_count_$dt.csv
echo "MicroService,Average_RTT(sec)" > $path/ms_rtt_$dt.csv

i=`ls -ltr|grep log|tail -1|awk '{print $9}'` 
#### Starting ms-wise hit count
for list in "${svcs[@]}";
	do
		a=`cat $i|awk '{print $6}'|grep $list|wc -l`
		echo $list,$a
		echo $list,$a >> $path/ms_hit_count_$dt.csv;
	done	
##### Starting ms-wise rtt
for x in "${svcs[@]}";
	do 
		a=`cat $i|grep $x|awk  '{ total += $(NF-1); count++ } END { print total/count }'`
		ms_rtt=`echo "scale=3 ; $a / 1"| bc`;
		if [ "$ms_rtt" != "10.000" ]; then
			echo $x,$ms_rtt
			echo $x,$ms_rtt >> $path/ms_rtt_$dt.csv
		fi
	done


