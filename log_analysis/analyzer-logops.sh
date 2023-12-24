#!/bin/bash
date
dt=`date --date="-1 day" +%d%b%y`
echo " Script started"
path=/home/bs960/imranMadbar/myPROJECT/log-analysis-automation/log_analysis
archivePath=$path/archive-data

echo " Old Report Archiving started"
cd $path/processing_data
ls -ltr | grep csv | awk '{print $9}' | zip -@ $archivePath/old_report_$dt.zip
echo " Old Report Archiving completed & removing csv files"
rm *.csv
echo " Old CSV reports are removed after archiving " 

echo " Starting report analysis ..."
echo " "
cd $path
	echo " Request status wise counts & percentage - Script Started "
./ops-file/request_status_analysis.sh
	echo " Request status wise counts & percentage - Script Completed "
	echo " MicroService wise request counts & average RTT - Script Started "
./ops-file/service_wise_req_analysis.sh
	echo " MicroService wise request counts & average RTT - Script Completed "

sleep 2
cd $path
python3 -u ops-file/report_processing.py
echo "report processing done"


echo " "
echo "##########  All Script Completed ##########"
