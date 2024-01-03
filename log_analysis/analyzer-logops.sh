#!/bin/bash
print_message() {
    local message=$1
    local spinner="/-\|"
    printf "%s " "$message"
    for i in $(seq 1 20); do
        printf "%s" "${spinner:i % 4:1}"
        sleep 0.1
        printf "\b"
    done
    printf "   \n"
}
date
dt=`date --date="-1 day" +%d%b%y`
path=/home/bs960/imranMadbar/myPROJECT/log-analysis-automation/log_analysis
archivePath=$path/archive-data
cd $path/processing_data
ls -ltr | grep csv | awk '{print $9}' | zip -@ $archivePath/old_report_$dt.zip
rm *.csv
echo "Old Report Archiving completed, Starting report analysis ..."
sleep 2
process_data() {
    total_steps=3
        cd $path
		./ops-file/request_status_analysis.sh
	sleep 2
	print_message "Processing step 1/$total_steps"
        ./ops-file/service_wise_req_analysis.sh
	sleep 3
    print_message "Processing step 2/$total_steps"
	    cd $path
        python3 -u ops-file/report_processing.py
    sleep 3
	print_message "Processing step 3/$total_steps"

    sleep 1
    echo "Processing completed!"
}
process_data


