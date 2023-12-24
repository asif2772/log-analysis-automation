#!/bin/bash
date
dt=`date --date="-1 day" +%d%b%y`;

path=/home/bs960/imranMadbar/myPROJECT/log-analysis-automation/log_analysis/processing_data
>$path/req_stat.txt

cd /home/bs960/imranMadbar/myPROJECT/log-analysis-automation/log_analysis/log-row-data
echo "STATUS,COUNT,PERCENTAGE"  > $path/req_stat_$dt.csv

i=`ls -ltr|grep log|tail -1|awk '{print $9}'` 
cat $i|awk '$8!=400{print $8}'|sort|uniq --repeated --count|awk '{print $2","$1}' >> $path/req_stat.txt
tot=`cat $path/req_stat.txt|awk -F "," '{ total += $2 } END { print total }'`
for i in `cat $path/req_stat.txt|awk -F "," '{print $1}'`; 
	do
	  count=`cat $path/req_stat.txt|grep $i|awk -F "," -v a=$i '{if ( $1 == a) print$ 2}'`
	  perc=`echo $(echo "scale=3; 100 * $count / $tot" | bc )`
	 if [  $i -eq 200 ] || [ $i -eq 202 ]; then
	  	echo OK_$i, $count, $perc
                echo OK_$i, $count, $perc >> $path/req_stat_$dt.csv
	   else
	  	echo NOT_OK_$i, $count, $perc		
	  	echo NOT_OK_$i, $count, $perc >> $path/req_stat_$dt.csv
	  fi ;
	done
rm $path/req_stat.txt
date

