#!/bin/bash
#author: Jaloliddin

#variables passed down from another script
ICNo=$1
empName=$2
startDate=$3
endDate=$4

#files
kpiDB="KPI.txt"
filename="${ICNo}KPIResult"

#variables
loop=y
average=0.0

function calcAverage() {
    
}

printf '%-50sEmployee Performance Review\n' >>$filename.txt
printf '%-50s===========================\n\n' >>$filename.txt
printf 'Employee IC. Number: %s\n' "$ICNo" >>$filename.txt
printf 'Employee Name: %s\n' "$empName" >>$filename.txt
printf 'Review Period: From %s To %s \n' "$startDate" "$endDate" >>$filename.txt
printf '%s========================================================================\n' >>$filename.txt
printf '%-30s %-30s %-30s\n' "KPI Criteria:" "Rate Obtained:" "Comments:" >>$filename.txt
printf '%s========================================================================\n' >>$filename.txt

while [ "$loop" = "y" ]; do
    echo "Employee Performance Review Form"
    echo "------------------------"
    echo -n "Please enter the KPI Code: "
    read kpi

    #loop to retrieve the kpi criteria based on kpi code
    while IFS=: read -r kpiCode kpiCriteria kpiDesc; do
        if [[ $kpi == $kpiCode ]]; then
            echo "KPI - Key Performance Indicator: $kpiCriteria"
            printCriteria=$kpiCriteria
        fi
    done <$kpiDB

    echo -n "Plese enter the Rate obtained (max 10 - min 0): "
    read rate

    echo -n "Comments (if any): "
    read comment

    printf '%-30s %-30s %-30s\n' "$printCriteria" "$rate" "$comment" >>$filename.txt

    echo -n "Press (y) to continue to the Employee's marks or (b) to return to the previous screen: "
    read loop
done

case $loop in
b) ./EmpValidationForm.sh ;;
*) echo -n "Invalid Choice!" ;;
esac

if [[ $loop = b ]]; then

fi
